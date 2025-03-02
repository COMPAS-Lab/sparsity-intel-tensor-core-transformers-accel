import numpy as np
import struct
import codecs
import argparse
import math
import itertools
from enum import Enum
# import torch
from random import sample
import json
import os, io
import shutil
from cProfile import Profile
from pstats import Stats, SortKey

def float_to_hex(f: float):
	# Courtesy of https://stackoverflow.com/a/23624284
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])[2:].zfill(8)

def hex_to_float(x: str):
	# still from stackoverflow
    return struct.unpack('!f', codecs.decode(x,'hex'))[0]

def hex_to_bin(x: str, n_bits: int):
    return bin(int(x, 16))[2:].zfill(n_bits)

def bin_to_hex(x: str, n_bits: int):
    return hex(int(x, 2))[2:].zfill(n_bits//4)

def int_idx_to_bin(index: int, width: int) -> str:
    return "0" + bin(index)[2:].zfill(width-1)

def twos_comp(x: str, sign: str):
    if sign == "0":
        return "0" + x
    else:
        new_x = ""
        for b in x:
            new_x += "1" if b == "0" else "0"
        res = bin(int(new_x, 2) + 1)[2:]
        return "1" + res
    
def find_nearest(array: list, value: float):
    array = np.asarray(array)
    idx = (np.abs(array - value)).argmin()
    # print(f"selecting {array[idx]} at {idx}")
    return idx

def pad_str_dat_to_len(dat: str, tar_len: int, padding_val = "0"):
    ori_len = len(dat)
    assert ori_len <= tar_len, "target len must > original len"
    padded = (tar_len - ori_len) * padding_val + dat
    return padded

def update_or_create_json(file_path, a):
    """
    Updates or creates a JSON file.
    
    Parameters:
    - file_path (str): Path to the JSON file.
    - a (dict): Dictionary to append to the file's content or write if the file doesn't exist.
    """
    if os.path.exists(file_path):
        with open(file_path, 'r') as file:
            try:
                existing_data = json.load(file)
                if not isinstance(existing_data, dict):
                    raise ValueError("The file does not contain a valid JSON object.")
            except json.JSONDecodeError:
                existing_data = {}
        
        existing_data.update(a)
    else:
        existing_data = a

    with open(file_path, 'w') as file:
        json.dump(existing_data, file, indent=4)
    
    print(f"File '{file_path}' updated with data: {existing_data}")

def compute_thrpt(a_h, a_w, b_w, total_latency, freq):
    # compute throughput
    total_ops = a_h * a_w * 2 * b_w
    time_latency = total_latency * 1./freq * 1e-6
    flops = total_ops / time_latency / 1e12
    return flops

class BfpType(Enum):
    BFP_12 = 0
    BFP_16 = 1

class BFP():
    bfp_struct = None
    randgen_cand = [0.25, 0.3125, 0.375, 0.4375]
    def __init__(self, bfp_type: BfpType) -> None:
        if bfp_type == BfpType.BFP_12:
            self.bfp_struct = {"mant_bits": 3, "exp_bits":8, "sign_bits": 1, "blk_size": 20}
        if bfp_type == BfpType.BFP_16:
            self.bfp_struct = {"mant_bits": 7, "exp_bits":8, "sign_bits": 1, "blk_size": 10}

    def format_name(self) -> str:
        if self.bfp_struct["blk_size"] == 20:
            return "BFP12"
        else:
            return "BFP16"

    def mant_bits(self) -> int:
        if self.bfp_struct:
            return self.bfp_struct["mant_bits"]
        else:
            return -1
        
    def exp_bits(self) -> int:
        if self.bfp_struct:
            return self.bfp_struct["exp_bits"]
        else:
            return -1
        
    def sign_bits(self): return 1

    def blk_size(self):
        if self.bfp_struct:
            return self.bfp_struct["blk_size"]
        else:
            return -1
    
    def blk_bits(self, idx_size = None):
        blk_width = self.exp_bits() + (self.sign_bits() + self.mant_bits()) * self.blk_size()
        if idx_size:
            ridx_size, cidx_size = idx_size
            return blk_width + ridx_size + 1 + cidx_size + 1
        else:
            return blk_width

    def is_vec_tail(self, vec: str, idx_size: tuple) -> bool:
        res = False
        ridx_size, cidx_size = idx_size
        if vec == ("1" * ridx_size + "0" * self.blk_bits()) :
            res = True

        return res
    
    def vec_to_bfp_block(self, blk_r):
        fp32_blk_elems = [f for f in blk_r]
        blk_elems = [float_to_hex(f) for f in blk_r]
        exps = [int(hex_to_bin(e, 32)[1:9], 2) for e in blk_elems]
        mants = [hex_to_bin(e, 32)[9:9 + self.mant_bits()+1] for e in blk_elems]
        signs = [hex_to_bin(e, 32)[0] for e in blk_elems]
        
        # TODO: be careful for the situation where part of the inputs are zero
        blk_res = bin(max(max(exps)-2, 0))[2:].zfill(8)

        possible_vals = [v*(2**(max(exps)-2-127)) for v in range(2**self.mant_bits())]
        possible_mants = [bin(int(v))[2:].zfill(self.mant_bits()) for v in range(2**self.mant_bits())]
        for i in range(len(blk_elems)):
            ## nearest val rounding
            if signs[i] == "1":
                possible_vals = [0-v for v in possible_vals]
            final_mant = possible_mants[find_nearest(possible_vals, fp32_blk_elems[i])]
            final_mant = twos_comp(final_mant, signs[i])
            ## truncation rounding:            
            # mant_with_sign = "0" * (self.mant_bits() + 2) \
            #     if blk_elems[i] == "00000000" else "1" + mants[i]
            # shifted_mant = "0" * (self.mant_bits() + 2) \
            #     if (max(exps) - exps[i]) > len(mant_with_sign) \
            #     else mant_with_sign[0:len(mant_with_sign) - (max(exps) - exps[i]) + 1].zfill(len(mant_with_sign))
            # final_mant = twos_comp(shifted_mant, signs[i])[0:self.mant_bits() + 1]
            blk_res += final_mant
        return blk_res

    def to_bfp(self, blk_list: list, idx: tuple = None, insert_vec_tail = True, ridx_size=0, cidx_size=0, enable_row_subgrps=False) -> tuple:
        '''
        expect tensor size - data: (nblks, c, 20) idx: (nblks,)
        return: (nblks, blks_str), int, int as list
        '''
        res = []

        if idx:
            assert(len(idx[0]) == len(idx[1]))
            assert(len(idx[0]) == len(blk_list))
            max_ridx = np.amax(idx[0])
            req_ridx_size = len(bin(int(max_ridx))[2:]) + 1
            max_cidx = np.amax(idx[1])
            req_cidx_size = len(bin(int(max_cidx))[2:]) + 1
            
            # set bitwidth of ridx
            ridx_size = ridx_size if ridx_size > 0 else req_ridx_size
            cidx_size = cidx_size if cidx_size > 0 else req_cidx_size

            assert((ridx_size >= req_ridx_size) and (cidx_size >= req_cidx_size))
            print(f"select idx bitwidth as {ridx_size}, {cidx_size}")
        
        last_ridx = idx[0][0] if idx else None
        # bfp conversion and idx attaching
        if enable_row_subgrps:
            curr_row_blks = [[] for i in range(3)]
            for rec_idx, blk in enumerate(blk_list):
                # blk is a 3xblk_size block
                if insert_vec_tail and idx:
                    curr_ridx = idx[0][rec_idx]
                    if curr_ridx > last_ridx:
                        # insert vector tail into the list
                        tail_blk = "1" * ridx_size + "0" * self.blk_bits()
                        last_ridx = curr_ridx
                        for sub_row in curr_row_blks:
                            sub_row.append(tail_blk)
                        res.append(curr_row_blks)
                        curr_row_blks = [[] for i in range(3)]

                # expand each 3-row group
                for sub_r, blk_r in enumerate(blk):
                    blk_res = self.vec_to_bfp_block(blk_r)
                    if idx:
                        blk_res = int_idx_to_bin(idx[0][rec_idx], ridx_size) + blk_res

                    assert(len(blk_res) == (88 + ridx_size))
                    
                    # push new blocks in the row on the top so that it will be written in the file first,
                    # then loaded into the deeper tc cores
                    curr_row_blks[sub_r] = [blk_res] + curr_row_blks[sub_r]

                # append last group to the result
                if rec_idx == len(blk_list) - 1:
                    if insert_vec_tail and idx:
                        # insert vector tail into the list
                        tail_blk = "1" * ridx_size + "0" * self.blk_bits()
                        last_ridx = curr_ridx
                        for sub_row in curr_row_blks:
                            sub_row.append(tail_blk)
                        res.append(curr_row_blks)
                        curr_row_blks = [[] for i in range(3)]

        else:
            for rec_idx, blk in enumerate(blk_list):
                if idx:
                    curr_ridx = idx[0][rec_idx]
                    if insert_vec_tail and curr_ridx > last_ridx:
                        # insert vector tail into the list
                        res.append("1" * (ridx_size + 1) + "1" * (cidx_size + 1) + "0" * self.blk_bits())
                        last_ridx = curr_ridx
                
                blk_res = self.vec_to_bfp_block(blk)

                if idx:
                    blk_res = int_idx_to_bin(idx[0][rec_idx], ridx_size) + \
                                int_idx_to_bin(idx[1][rec_idx], cidx_size) + blk_res

                res.append(blk_res)
            
        return res, (ridx_size, cidx_size)

    def idx_redremove_gen(self, idx: tuple, n_shared_chans: int, ridx_size=0, cidx_size=0):
        '''
        expect size - idx: (nblks,)
        '''
        res = []

        def int_idx_to_bin(index: int, width: int) -> str:
            return "0" + bin(index)[2:].zfill(width-1)

        def construct_idx_dest_pair(curr_blk_list: list) -> list[tuple]:
            idx_dest_pairs = []

            total_idx_count = len(list(itertools.chain(*curr_blk_list)))
            sorted_idx_res = list(np.unique(list(itertools.chain(*curr_blk_list))))

            # print(f"col idx remain rate: {len(sorted_idx_res) / total_idx_count:.4f}")
            sorted_idx_res.sort(reverse=True)
            curr_sorted_res_bitmasks = ["0"] * n_shared_chans
            for unrep_elem in sorted_idx_res:
                curr_sorted_res_bitmasks = ["0"] * n_shared_chans
                for tc_col in range(n_shared_chans):
                    if unrep_elem in curr_blk_list[tc_col]:
                        curr_sorted_res_bitmasks[n_shared_chans - 1 - tc_col] = "1"

                idx_dest_pairs.append((unrep_elem, "".join(curr_sorted_res_bitmasks)))

            return idx_dest_pairs

        assert(len(idx[0]) == len(idx[1]))

        # set bitwidth of ridx
        max_ridx = np.amax(idx[0])
        req_ridx_size = len(bin(int(max_ridx))[2:]) + 1
        max_cidx = np.amax(idx[1])
        req_cidx_size = len(bin(int(max_cidx))[2:]) + 1
        
        # set bitwidth of ridx
        ridx_size = ridx_size if ridx_size > 0 else req_ridx_size
        cidx_size = cidx_size if cidx_size > 0 else req_cidx_size

        assert((ridx_size >= req_ridx_size) and (cidx_size >= req_cidx_size))
        print(f"select idx bitwidth as {ridx_size}, {cidx_size}")
        
        last_ridx = idx[0][0] if idx else None
        curr_idx_blk = [[] for i in range(n_shared_chans)]
        curr_rowblk_counter = 0
        idx_grps = []
        # bfp conversion and idx attaching
        for rec_idx in range(len(idx[0])):
            curr_ridx = idx[0][rec_idx]
            if curr_ridx > last_ridx:
                last_ridx = curr_ridx
                curr_rowblk_counter += 1

            if curr_rowblk_counter == n_shared_chans:
                curr_unique_idx_desp_pair = construct_idx_dest_pair(curr_idx_blk)
                idx_grps += [(int_idx_to_bin(i[0], cidx_size), i[1]) for i in curr_unique_idx_desp_pair] 
                idx_grps += [("1" * cidx_size, "0" * n_shared_chans)]
                curr_idx_blk = [[] for i in range(n_shared_chans)]
                curr_rowblk_counter = 0

            curr_idx_blk[curr_rowblk_counter].append(idx[1][rec_idx])

            # tail
            if rec_idx == len(idx[0])-1:
                curr_unique_idx_desp_pair = construct_idx_dest_pair(curr_idx_blk)
                idx_grps += [(int_idx_to_bin(i[0], cidx_size), i[1]) for i in curr_unique_idx_desp_pair] 
                idx_grps += [("1" * cidx_size, "0" * n_shared_chans)]
                curr_idx_blk = [[] for i in range(n_shared_chans)]
                curr_rowblk_counter = 0

        return idx_grps


    def gen_bfp_friendly_data(self, size: tuple):
        gen_mask = np.random.randint(low=0, high=len(self.randgen_cand), size=size)
        res = np.zeros(size, dtype=float)
        for i in range(len(self.randgen_cand)):
            res[np.where(gen_mask == i)] = self.randgen_cand[i]

        return res

IN_DAT_PATH = "/compas-old/projects/sparse-attention"
OUT_DAT_PATH = "/compas-old/projects/sparse-attention/onchip-maxhbm"

def mat_a_gen(
        mat_src_name: str, 
        bfp_type: BFP, 
        n_hw_cols: int = 1, 
        ridx_size = 9, 
        cidx_size=9, 
        n_large_blocks = -1,
        hidx_list = None,
        bfp_friendly_dat = False,
        disable_file_writting = False,
        ):
    '''
    assuming mat A is a 3xthree_vec_len mat block:

    mat_src_name: str, path of matrix source file in npy
    bfp_type: BFP, BFP type
    n_hw_cols: int = 1, number of columns of tensor blocks
    ridx_size = 9, hardware row idx bitwidth
    cidx_size = 9, hardware col idx bitwidth
    n_large_blocks = 1, number of large blocks to split a matrix to avoid input blocking problem
    bfp_friendly_dat = False, if to generate BFP-accurate data for easier debugging
    '''
    mat_a_src = np.load(IN_DAT_PATH + f"/{mat_src_name}_val.npy")
    mat_a_src_ridx = np.load(IN_DAT_PATH + f"/{mat_src_name}_ridx.npy")    
    mat_a_src_cidx = np.load(IN_DAT_PATH + f"/{mat_src_name}_cidx.npy")

    assert mat_a_src.shape[-1] == bfp_type.blk_size(), "BFP block size mismatch"

    # extract one head
    headgrp_vals, headgrp_ridx, headgrp_cidx = [], [], []
    curr_head_val, curr_head_ridx, curr_head_cidx = [], [], []
    for ridx, cidx, val in zip(mat_a_src_ridx, mat_a_src_cidx, mat_a_src):
        if ridx == -1 and cidx == -1:
            headgrp_vals.append(curr_head_val.copy())
            headgrp_ridx.append(curr_head_ridx.copy())
            headgrp_cidx.append(curr_head_cidx.copy())
            curr_head_val, curr_head_ridx, curr_head_cidx = [], [], []
        else:
            if bfp_friendly_dat:
                curr_head_val.append(bfp_type.gen_bfp_friendly_data((3, 20)))
            else:
                curr_head_val.append(val)
            curr_head_ridx.append(ridx)
            curr_head_cidx.append(cidx)

    # fetch a head
    hidices = []
    if hidx_list is None:
        # selecting 3 head from each layer
        n_layers = len(headgrp_ridx) // 32
        for l in np.arange(0, n_layers, 4):
            hidices += list(sample(range(l*32, (l+4)*32), 3))
    else:
        hidices = hidx_list

    print(f"get {len(headgrp_ridx)} heads in total, selecting head {hidices}")

    for hidx in hidices:
        src_val_h, src_ridx_h, src_cidx_h = headgrp_vals[hidx], headgrp_ridx[hidx], headgrp_cidx[hidx] 

        if n_large_blocks == -1:
            n_large_blocks_actual = math.ceil(len(src_ridx_h) / 2048)
        else:
            n_large_blocks_actual = n_large_blocks

        # split matrix into large blocks if needed
        if n_large_blocks_actual > 1:
            # Split src_ridx_h into uniformly distributed bins with integer edges
            r_hist, r_binedges = np.histogram(src_ridx_h, bins=100)
            print(f"rbin edges: {r_binedges}")
            r_blk_tail_bar = 2048
            r_blk_tails, curr_hist_sum = [], 0
            for h, e in zip(r_hist, r_binedges[1:]):
                curr_hist_sum += h
                if curr_hist_sum >= r_blk_tail_bar:
                    r_blk_tails.append(e)
                    curr_hist_sum = 0

            if r_blk_tails[-1] != r_binedges[-1]:
                r_blk_tails[-1] = r_binedges[-1]
            
            split_spots = [-1] + [np.argmax(src_ridx_h > i)-1 for i in r_blk_tails]
            if split_spots[-1] != len(src_ridx_h)-1:
                split_spots[-1] = len(src_ridx_h)-1
            src_val_lblks = [src_val_h[i+1:j+1] for i, j in zip(split_spots[:-1], split_spots[1:])]
            src_ridx_lblks = [src_ridx_h[i+1:j+1] for i, j in zip(split_spots[:-1], split_spots[1:])]
            src_cidx_lblks = [src_cidx_h[i+1:j+1] for i, j in zip(split_spots[:-1], split_spots[1:])]
            # check if each sub-list's first element is different from previous sub-list's last element in the src_ridx_lblks
            for i in range(len(src_ridx_lblks)-1):
                assert(src_ridx_lblks[i][-1] != src_ridx_lblks[i+1][0])
        else:
            src_val_lblks = [src_val_h]
            src_ridx_lblks = [src_ridx_h]
            src_cidx_lblks = [src_cidx_h]

        n_large_blocks_actual = len(src_ridx_lblks)
        print(f"head {hidx} is split into {n_large_blocks_actual} large blocks")

        for large_blk_idx in range(n_large_blocks_actual):
            # prepare mat a
            # pad rows to align with number of TC cols
            curr_num_rows = len(np.unique(src_ridx_lblks[large_blk_idx]))
            nrows_to_pad = math.ceil(curr_num_rows / n_hw_cols) * n_hw_cols - curr_num_rows
            src_val = src_val_lblks[large_blk_idx] + [np.zeros((3, bfp_type.blk_size()))] * nrows_to_pad
            src_ridx = src_ridx_lblks[large_blk_idx] + [src_ridx_lblks[large_blk_idx][-1] + 1 + i for i in range(nrows_to_pad)]
            src_cidx = src_cidx_lblks[large_blk_idx] + [0] * nrows_to_pad

            bfp_res, idx_width = bfp_type.to_bfp(src_val, (src_ridx, src_cidx), 
                                                insert_vec_tail = True, ridx_size=ridx_size, cidx_size=cidx_size,
                                                enable_row_subgrps = True)
            idx_after_redremove = bfp_type.idx_redremove_gen((src_ridx, src_cidx), n_hw_cols, ridx_size=ridx_size, cidx_size=cidx_size)

            if not disable_file_writting:
                out_path = OUT_DAT_PATH + f"/{mat_src_name}"
                if not os.path.isdir(out_path):
                    os.makedirs(out_path)

                fnames = [out_path + "/" + f"MAT_A_{bfp_type.format_name()}_b{b_size}_h{hidx}_lb{large_blk_idx}.bin" for b_size in range(n_hw_cols)]
                fps = [open(fname, "w+", encoding='utf-8') for fname in fnames]
                idx_fname = out_path + "/" + f"IDX_GEN_h{hidx}_lb{large_blk_idx}.bin"
                idx_fp = open(idx_fname, "w+", encoding='utf-8')

                f_idx = 0
                n_blks = 0
                for big_row in bfp_res:
                    assert(len(big_row[0]) == len(big_row[1]) and len(big_row[1]) == len(big_row[2]))
                    n_blks += 3 * len(big_row[0])
                    for b_idx in range(len(big_row[0])-1):
                        fps[f_idx].write(big_row[0][b_idx] + "\n")
                        fps[f_idx].write(big_row[1][b_idx] + "\n")
                        fps[f_idx].write(big_row[2][b_idx] + "\n")

                    if bfp_type.is_vec_tail(big_row[0][b_idx+1], idx_width):
                        fps[f_idx].write(big_row[0][b_idx+1] + "\n")
                        assert(len(big_row[0][b_idx+1]) == len(big_row[2][b_idx]))
                        f_idx = int((f_idx + 1) % n_hw_cols)

                print("{} big rows written to A large blk {}.".format(len(bfp_res), large_blk_idx))
                print(f"mat A large blk total size: {n_blks * 88 / 1024. / 1024. / 8:.2f} MB")

                for f in fps:
                    f.close()

                print("generate reduced index...")
                for idx_pair in idx_after_redremove:
                    idx_fp.write(idx_pair[0] + idx_pair[1] + "\n")
                idx_fp.close()

        # construct dense mat from selected head to compute gold reference
        # TODO: change COO parsing to generate result for multiple matrices
        coo_pairs = []
        for br, bc, bv in zip(src_ridx, src_cidx, src_val):
            curr_cids = [bc * bfp_type.blk_size() + i for i in range(bfp_type.blk_size())]
            curr_rids = [br * 3 + i for i in range(3)]
            for v_r, rid in enumerate(curr_rids):
                for v_c, cid in enumerate(curr_cids):
                    coo_pairs.append((rid, cid, bv[v_r][v_c]))

        coo_pairs = sorted(coo_pairs)
        assert(len(coo_pairs) == len(src_val) * 3 * bfp_type.blk_size())
        
        coo_idx = [[p[0] for p in coo_pairs], [p[1] for p in coo_pairs]]
        coo_vals = [p[2] for p in coo_pairs]
        mat_shape = max(coo_idx[0] + coo_idx[1])
        # mat = torch.sparse_coo_tensor(coo_idx, coo_vals, size=(mat_shape, mat_shape)).to_dense().numpy()
    
    if not disable_file_writting:
        # copy inst_profile.json
        shutil.copyfile(IN_DAT_PATH + f"/{mat_src_name}.json", 
            out_path + "/" + "inst_profile.json")
    
    return None

def mat_b_gen(mat_src_name: str, chain_len: int, bfp_type: BFP, n_blocks_split: int = 1):
    # matB = np.random.uniform(low=0., high=1.0, size=size).astype('f')
    # matB = np.random.randint(low=0, high=2, size=size)
    matB_size = None
    with open(OUT_DAT_PATH + f"/{mat_src_name}/inst_profile.json", "r") as mat_src_f:
        mat_prof = json.load(mat_src_f)
        matB_size = (mat_prof["seq_len"], 128)

    matB = bfp_type.gen_bfp_friendly_data(matB_size)
    print("mat b original size: ", matB.shape)
    
    # pad mat b to align with chain_len x BFP size
    align_size = chain_len * bfp_type.blk_size()
    required_padding_size = int(align_size - matB_size[0] % align_size)
    col_size = math.ceil(matB_size[1] / n_blocks_split) * n_blocks_split
    required_vec_padding_size = int(col_size - matB_size[1])
    if required_padding_size > 0:
        padded_matB = np.pad(
            matB, 
            pad_width=((0, required_padding_size), (0, required_vec_padding_size)), 
            mode="constant", 
            constant_values=0.0)
    else:
        padded_matB = matB

    print(f"padded mat b size: {padded_matB.shape}")
    mat_b_vec_load_size = int(padded_matB.shape[0] / bfp_type.blk_size())
    matb_blk_size = math.ceil(matB_size[1] / n_blocks_split)
    for matb_blk_idx in range(n_blocks_split):
        # split mat b into chunks of interleaved cols
        # chunk 0: 0, 22, 44, 66...
        # chunk 1: 1, 23, 45, 67...
        vec_ids = [vec*n_blocks_split + matb_blk_idx for vec in range(matb_blk_size)]
        # blk_size_range_h = matb_blk_idx * matb_blk_size
        # blk_size_range_t = min(blk_size_range_h + matb_blk_size, size[1])
        matb_blk = padded_matB[:, vec_ids]
        # transpose
        chunkedBTrans = np.transpose(matb_blk).reshape(-1, bfp_type.blk_size())
        # bfp conversion
        bfp_res, _ = bfp_type.to_bfp(list(chunkedBTrans))

        fname = OUT_DAT_PATH + f"/{mat_src_name}" + f"/MAT_B_{bfp_type.format_name()}_all.bin"
        if matb_blk_idx == 0:
            f = open(fname, "w+", encoding='utf-8')
        else:
            f = open(fname, "a", encoding='utf-8')

        for i in bfp_res:
            f.write(i + "\n")
        print("{} lines written to B.".format(len(bfp_res)))
        print(f"mat B total size: {len(bfp_res) * len(bfp_res[0]) / 1024. / 1024. / 8 :.2f} MB")
        f.close()

    update_or_create_json(OUT_DAT_PATH + f"/{mat_src_name}/inst_profile.json", {"mat b vec size": mat_b_vec_load_size})
    return matB

def check_outputs(sim_out_fname: str, ori_fname, num_tc_rows: int, num_tc_cols: int):
    num_tcchaines = num_tc_rows * num_tc_cols
    # each list of sim_out stores the results from one tc chain
    sim_out = [[] for i in range(num_tcchaines)]

    lines = []
    with open(sim_out_fname, "r", encoding="utf-8") as f:
        lines = f.readlines()
        # skip comments
        lines = lines[3:]

    line_num = len(lines)

    if line_num % num_tcchaines != 0:
        raise Exception("invalid output mem file")

    for line_idx,elem in enumerate(lines):
        fp32_strs = [elem[l:l+6] + "00" for l in range(0, len(elem), 6)]
        sim_out[line_idx % num_tcchaines] += [hex_to_float(sub_l) for sub_l in fp32_strs[:-1]]
    
    original = np.load(ori_fname)

    final_res = []
    for block in sim_out:
        reshaped_blk = np.array(block).reshape(-1, 3).transpose()
        final_res.append(reshaped_blk)

    swapped_final_res = []
    for i in range(num_tc_cols):
        temp_row_blk = []
        for j in range(num_tc_rows):
            temp_row_blk.append(final_res[i+j*num_tc_cols])
        swapped_final_res.append(np.concatenate(temp_row_blk, axis=1))

    final_res = np.concatenate(swapped_final_res, axis=0)
    print(final_res)

    err = np.divide(np.abs(np.subtract(final_res, original)), original)
    
    print("max err: ", np.max(err))
    print("min err: ", np.min(err))
    print("average err: ", np.mean(err))

def prepare_onchip_input_files(input_path: str, n_shared_chans: int, head_idx: int, n_large_blocks: int):
    if input_path[-1] != "/":
        input_path += "/"

    hbm_a_len_list = []
    for lb_idx in range(n_large_blocks):
        mat_a_files = \
            [input_path + f"MAT_A_BFP12_b{i}_h{head_idx}_lb{lb_idx}.bin" for i in range(n_shared_chans)]

        # import A file
        mat_data = [[] for i in range(n_shared_chans)]
        for fidx, fname in enumerate(mat_a_files):
            with open(fname, "r", encoding="utf-8") as f:
                lines = [line.rstrip() for line in f]
                mat_data[fidx] += lines

        padded = "1" + "0" * (len(mat_data[0][0]) - 1)
        lens = [len(m) for m in mat_data]
        print(f"all lens: {lens}")
        # align the data length of all shared channels
        total_len = max(lens)
        for midx in range(n_shared_chans):
            if lens[midx] < total_len:
                mat_data[midx] += [padded] * (total_len - lens[midx])

        assert len(np.unique([len(m) for m in mat_data])) == 1, "mat a data not aligned"

        # split into upper and lower mem files
        n_chans_in_hbm_grp = 4 
        n_chans_in_hbm_grp_per_iter = 4
        n_load_iters = n_chans_in_hbm_grp // n_chans_in_hbm_grp_per_iter
        n_hbms_per_grp = 2
        n_hbm_grps = n_shared_chans // n_chans_in_hbm_grp
        n_hbm_bwidth = 256

        for i_g_hbm in range(n_hbm_grps):
            hbm_dat = []
            mat_data_hbm_grp = mat_data[n_chans_in_hbm_grp * i_g_hbm : n_chans_in_hbm_grp * (i_g_hbm + 1)]
            for rid in range(total_len):
                for i_iter in range(n_load_iters):
                    partial_dat = ""
                    # for each iter's group pad it to n_hbms_per_grp
                    for cid in range(n_chans_in_hbm_grp_per_iter):
                        partial_dat = pad_str_dat_to_len(
                            mat_data_hbm_grp[cid + i_iter * n_chans_in_hbm_grp_per_iter][rid], 
                            n_hbm_bwidth * n_hbms_per_grp) + partial_dat

                    hbm_dat.append(bin_to_hex(partial_dat, n_hbms_per_grp * n_hbm_bwidth))

            print(f"total len: {total_len}")
            hbm_a_len_list.append(len(hbm_dat))

            for i_hbm in range(n_hbms_per_grp):
                with open(input_path + f"onchip_mat_a_hbm{i_g_hbm * n_hbms_per_grp + i_hbm}_h{head_idx}_lb{lb_idx}.mem", "w", encoding="utf-8") as f:
                    for l in hbm_dat:
                        f.write(l[i_hbm * (n_hbm_bwidth//4) : (i_hbm+1) * (n_hbm_bwidth//4)] + "\n")

    update_or_create_json(input_path + f"hwconfig_h{head_idx}.json", {"mat a size": hbm_a_len_list})
    

def prepare_onchip_idx_file(
        input_path: str, n_shared_chans: int, cidx_width: tuple, head_idx: int, n_large_blocks: int, align_to=256):
    if input_path[-1] != "/":
        input_path += "/"

    idx_len_list = []
    for lb_idx in range(n_large_blocks):
        # import index file
        idx, bitmask = [], []
        with open(input_path + f"IDX_GEN_h{head_idx}_lb{lb_idx}.bin", "r", encoding="utf-8") as f:
            lines = [line.rstrip() for line in f]
            for l in lines:
                idx.append(l[:cidx_width])
                bitmask.append(l[cidx_width:cidx_width+n_shared_chans])

        print(f"idx len: {len(idx)}")
        interm_iter_res, final_res = [[] for i in range(n_shared_chans)], []
        for i in range(len(idx)):
            if idx[i] == "1" * cidx_width and bitmask[i] == "0" * n_shared_chans:
                max_vec_len = max([len(c) for c in interm_iter_res])
                for c in range(n_shared_chans):
                    if len(interm_iter_res[c]) < max_vec_len:
                        interm_iter_res[c] += ["1"*cidx_width] * (max_vec_len - len(interm_iter_res[c]))

                for l in range(max_vec_len):
                    res_line = [interm_iter_res[c][l] for c in range(n_shared_chans)]
                    final_res.append(bin_to_hex("".join(res_line), align_to) + "\n")

                final_res.append(bin_to_hex(("1" * cidx_width) * n_shared_chans, align_to) + "\n")
                interm_iter_res = [[] for i in range(n_shared_chans)]
            else:
                for chan_id in range(n_shared_chans):
                    if(bitmask[i][chan_id] == "1"):
                        interm_iter_res[chan_id].append(idx[i])
        
        with open(input_path + f"onchip_idx_hbm_h{head_idx}_lb{lb_idx}.mem", "w", encoding="utf-8") as f:
            f.writelines(final_res)

        print(f"idx file len: {len(final_res)}")
        idx_len_list.append(len(final_res))
    
    update_or_create_json(input_path + f"hwconfig_h{head_idx}.json", {"idx_len": idx_len_list})

def prepare_onchip_matb_file(input_path: str, align_to=256, head_idx=0):
    if input_path[-1] != "/":
        input_path += "/"

    # import mat b file
    lines = []
    with open(input_path + f"MAT_B_BFP12_all.bin", "r", encoding="utf-8") as f:
        lines = [line.rstrip() for line in f]

    if not os.path.exists(input_path + f"onchip_mat_b_hbm.mem"):
        with open(input_path + f"onchip_mat_b_hbm.mem", "w", encoding="utf-8") as f:
            for l in lines:
                f.writelines(bin_to_hex(l, align_to) + "\n")
    
    update_or_create_json(input_path + f"hwconfig_h{head_idx}.json", {"mat b size": len(lines)})
    with open(input_path + "/inst_profile.json", "r") as inst_pf:
        inst_infos = json.load(inst_pf)
        update_or_create_json(input_path + f"hwconfig_h{head_idx}.json", {"mat b vec size": inst_infos["mat b vec size"]})

def main(args: dict):
    hw_row = 6
    hw_col = 12
    n_large_blocks = int(args['large-blocks'])
    
    if args["head-indices"] is not None:
        print(f"generating specific head indices: {args['head-indices']}")
        head_idx = [int(i) for i in args["head-indices"]]

    if args['inputs_gen']:
        chain_len = int(args['chain_len'])

        if args["data-path"]:
            if args["profile-runtime"]:
                print("generating runtime profile")
                with Profile() as pr:
                    matA = mat_a_gen(
                        args["data-path"], 
                        BFP(BfpType.BFP_12), 
                        hw_col, 
                        ridx_size=12, 
                        cidx_size=10, 
                        bfp_friendly_dat=False, 
                        n_large_blocks=n_large_blocks, 
                        hidx_list=head_idx,
                        disable_file_writting=True
                    )
                    s = io.StringIO()
                    ps = Stats(pr, stream=s).strip_dirs().sort_stats(SortKey.CALLS)
                    ps.print_stats()

                    with open("runtime_profile.txt", "w") as f:
                        f.write(s.getvalue())
            else:
                matA = mat_a_gen(
                        args["data-path"], 
                        BFP(BfpType.BFP_12), 
                        hw_col, 
                        ridx_size=12, 
                        cidx_size=10, 
                        bfp_friendly_dat=False, 
                        n_large_blocks=n_large_blocks, 
                        hidx_list=head_idx
                )
        else:
            matA = mat_a_gen(
                    "midsize", 
                    BFP(BfpType.BFP_12), 
                    hw_col, ridx_size=12, 
                    cidx_size=10, 
                    bfp_friendly_dat=True, 
                    n_large_blocks=n_large_blocks, 
                    hidx_list=head_idx
                )

        matB = mat_b_gen(args["data-path"], chain_len, BFP(BfpType.BFP_12), hw_row)
        # res = np.matmul(matA, matB)
        # print(f"mat a shape: {matA.shape}, mat b shape: {matB.shape}, res shape: {res.shape}")
        # np.save("sparse_matmul_data/mult_a_b_fp32_mata.npy", matA)
        # np.save("sparse_matmul_data/mult_a_b_fp32_matb.npy", matB)
        # np.save("sparse_matmul_data/mult_a_b_fp32_res.npy", res)

    if args['outputs-check']:
        fname = str(args['outputs-check'])
        correct_res_filename = str(args['correct_res'])
        check_outputs(fname, correct_res_filename, 1, 1)

    if args['view-npy']:
        fname = str(args['view-npy'])
        res = np.load(fname)
        print(res)

    if args['create-binary']:
        path = str(args['data-path'])
        head_list = []
        inst_list = [f.split(".")[0] \
                for f in os.listdir(path) \
                if os.path.isfile(path + f) and f.endswith(".bin") and "IDX_GEN" in f]
        head_list = np.unique([int(i.split("_")[-2][1:]) for i in inst_list])
        print(f"heads: {head_list}")
        for h in head_list:
            lb_flist = [f for f in inst_list if f"IDX_GEN_h{h}_" in f]
            lb_list = np.unique([int(f.split("_")[-1][2:]) for f in lb_flist])
            print(f"head {h} large blocks: {lb_list}")
            prepare_onchip_input_files(path, hw_col, head_idx=h, n_large_blocks=len(lb_list))
            prepare_onchip_idx_file(path, hw_col, 10, head_idx=h, n_large_blocks=len(lb_list))
            prepare_onchip_matb_file(path, 256, head_idx=h)
    
    if args['test']:
        bfp_format = BFP(BfpType.BFP_12)
        res = bfp_format.to_bfp([np.zeros((1, 20), dtype=float)])
        print(res)

    if args['throughput']:
        tp = compute_thrpt(4355, 4355, 128, 17901, 300)
        print(f"thr:{tp:.4f}")
  
if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("-ig", "--inputs-gen", help="generate mat a and b inputs for simulation", \
                                action="store_true", dest="inputs_gen")
    arg_parser.add_argument("-cl", "--chain-len", help="chain length", \
                                action="store", dest="chain_len")
    arg_parser.add_argument("-ci", "--compute-iter", help="compute iteration", \
                                action="store", dest="compute_iter")
    arg_parser.add_argument("-oc", "--outputs-check", help="check the correctness of the simulation output", \
                                action="store", dest="outputs-check")
    arg_parser.add_argument("-v", "--view-npy", help="view numpy file", \
                                action="store", dest="view-npy")
    arg_parser.add_argument("-cr", "--correct-res", help="path of the correct results", \
                                action="store", dest="correct_res")
    arg_parser.add_argument("-cb", "--create-binary", help="create binary file for on-chip test", \
                                action="store_true", dest="create-binary")
    arg_parser.add_argument("-tt", "--test", help="temp testing entry", \
                                action="store_true", default=False)
    arg_parser.add_argument("-th", "--throughput", help="temp compute throughput", \
                                action="store_true", default=False)
    arg_parser.add_argument("-dp", "--data-path", help="data path of mat a", \
                                action="store", dest="data-path", default=None)
    arg_parser.add_argument("-lb", "--large-blocks", help="number of large blocks", \
                                action="store", dest="large-blocks", default=-1)
    arg_parser.add_argument("-hidx", "--head-indices", help="list of head indices", \
                                nargs='+', type=int, dest="head-indices", default=None)
    arg_parser.add_argument("-pr", "--profile-runtime", help="profile runtime", \
                                action="store_true", dest="profile-runtime", default=False)

    args = vars(arg_parser.parse_args())

    if args['inputs_gen'] and args['chain_len'] is None:
        arg_parser.error("inputs generation requires a chain length AND a compute iteration!")

    if args['outputs-check'] and args['correct_res'] is None:
        arg_parser.error("must specify correct result to compare to.")

    main(args)