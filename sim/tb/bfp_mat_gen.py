import numpy as np
import struct
import codecs
import argparse
import math
import itertools
from enum import Enum
import torch

def float_to_hex(f: float):
	# Courtesy of https://stackoverflow.com/a/23624284
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])[2:].zfill(8)

def hex_to_float(x: str):
	# still from stackoverflow
    return struct.unpack('!f', codecs.decode(x,'hex'))[0]

def hex_to_bin(x: str, n_bits: int):
    return bin(int(x, 16))[2:].zfill(n_bits)

def twos_comp(x: str, sign: str):
    if sign == "0":
        return "0" + x
    else:
        new_x = ""
        for b in x:
            new_x += "1" if b == "0" else "0"
        res = bin(int(new_x, 2) + 1)[2:]
        return "1" + res

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
        if vec == (("1" * (ridx_size + 1) + "1" * (cidx_size + 1) + "0" * self.blk_bits()) ) :
            res = True

        return res

    def to_bfp(self, blk_list: list, idx: tuple = None, insert_vec_tail = True) -> tuple:
        '''
        expect tensor size - data: (nblks, c, 20) idx: (nblks,)
        return: (nblks, blks_str), int, int as list
        '''
        res = []
        ridx_size, cidx_size = 0, 0

        def int_idx_to_bin(index: int, width: int) -> str:
            return "0" + bin(index)[2:].zfill(width)

        if idx:
            assert(len(idx[0]) == len(idx[1]))
            assert(len(idx[0]) == len(blk_list))

            # set bitwidth of ridx
            max_ridx = np.amax(idx[0])
            max_cidx = np.amax(idx[1])
            ridx_size = len(bin(int(max_ridx))[2:])
            cidx_size = len(bin(int(max_cidx))[2:])
            print(f"select idx bitwidth as {ridx_size}, {cidx_size}")
        
        last_ridx = idx[0][0] if idx else None
        # bfp conversion and idx attaching
        for rec_idx, blk in enumerate(blk_list):
            if idx:
                curr_ridx = idx[0][rec_idx]
                if insert_vec_tail and curr_ridx > last_ridx:
                    # insert vector tail into the list
                    res.append("1" * (ridx_size + 1) + "1" * (cidx_size + 1) + "0" * self.blk_bits())
                    last_ridx = curr_ridx

            for sub_r, blk_r in enumerate(blk):
                blk_elems = [float_to_hex(f) for f in blk_r]
                exps = [int(hex_to_bin(e, 32)[1:9], 2) for e in blk_elems]
                mants = [hex_to_bin(e, 32)[9:9+self.mant_bits()+1] for e in blk_elems]
                signs = [hex_to_bin(e, 32)[0] for e in blk_elems]
                
                # TODO: be careful for the situation where part of the inputs are zero
                blk_res = bin(max(max(exps)-2, 0))[2:].zfill(8)

                for i in range(len(blk_elems)):
                    mant_with_sign = "0" * (self.mant_bits() + 2) \
                        if blk_elems[i] == "00000000" else "1" + mants[i]
                    shifted_mant = "0" * (self.mant_bits() + 2) \
                        if (max(exps) - exps[i]) > len(mant_with_sign) \
                        else mant_with_sign[0:len(mant_with_sign) - (max(exps) - exps[i]) + 1].zfill(len(mant_with_sign))
                    final_mant = twos_comp(shifted_mant, signs[i])[0:self.mant_bits() + 1]
                    blk_res += final_mant

                if idx:
                    blk_res = int_idx_to_bin(idx[0][rec_idx], ridx_size) + \
                                int_idx_to_bin(idx[1][rec_idx], cidx_size) + blk_res

                res.append(blk_res)
            
        return res, (ridx_size, cidx_size)

    def idx_redremove_gen(self, idx: tuple, n_shared_chans: int):
        '''
        expect size - idx: (nblks,)
        '''
        res = []
        ridx_size, cidx_size = 0, 0

        def int_idx_to_bin(index: int, width: int) -> str:
            return "0" + bin(index)[2:].zfill(width)

        assert(len(idx[0]) == len(idx[1]))

        # set bitwidth of ridx
        max_ridx = np.amax(idx[0])
        max_cidx = np.amax(idx[1])
        ridx_size = len(bin(int(max_ridx))[2:])
        cidx_size = len(bin(int(max_cidx))[2:])
        print(f"select idx bitwidth as {ridx_size}, {cidx_size}")
        
        last_ridx = idx[0][0] if idx else None
        curr_idx_blk = []
        curr_rowblk_counter = 0
        idx_grps = []
        # bfp conversion and idx attaching
        for rec_idx in range(len(idx[0])):
            curr_ridx = idx[0][rec_idx]
            if curr_ridx > last_ridx:
                curr_rowblk_counter += 1

            if curr_rowblk_counter == n_shared_chans:
                curr_unique_idx = list(np.unique(curr_idx_blk))
                idx_grps += [int_idx_to_bin(i, cidx_size) for i in curr_unique_idx] + ["1" * (cidx_size+1)]
                curr_idx_blk = []
                curr_rowblk_counter = 0

            curr_idx_blk.append(idx[1][rec_idx])

            # tail
            if rec_idx == len(idx[0])-1:
                curr_unique_idx = list(np.unique(curr_idx_blk))
                idx_grps += [int_idx_to_bin(i, cidx_size) for i in curr_unique_idx] + ["1" * (cidx_size+1)]
                curr_idx_blk = []
                curr_rowblk_counter = 0

        return idx_grps


    def gen_bfp_friendly_data(self, size: tuple):
        gen_mask = np.random.randint(low=0, high=len(self.randgen_cand), size=size)
        res = np.zeros(size, dtype=float)
        for i in range(len(self.randgen_cand)):
            res[np.where(gen_mask == i)] = self.randgen_cand[i]

        return res

DAT_PATH = "./sparse_matmul_data"

def mat_a_gen(mat_src_name: str, bfp_type: BFP, n_blocks_split: int = 1):
    '''
    assuming mat A is a 3xthree_vec_len mat block:
    '''
    mat_a_src = np.load(DAT_PATH + f"/{mat_src_name}_val.npy")
    mat_a_src_ridx = np.load(DAT_PATH + f"/{mat_src_name}_ridx.npy")    
    mat_a_src_cidx = np.load(DAT_PATH + f"/{mat_src_name}_cidx.npy")

    assert mat_a_src.shape[-1] == bfp_type.blk_size(), "block size mismatch"

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
            curr_head_val.append(val)
            curr_head_ridx.append(ridx)
            curr_head_cidx.append(cidx)

    # fetch a head
    hidx = 24
    print(f"get {len(headgrp_ridx)} heads in total, selecting head {hidx}")
    src_val, src_ridx, src_cidx = headgrp_vals[hidx], headgrp_ridx[hidx], headgrp_cidx[hidx] 

    # prepare mat a
    bfp_res, idx_width = bfp_type.to_bfp(src_val, (src_ridx, src_cidx), insert_vec_tail = True)
    idx_after_redremove = bfp_type.idx_redremove_gen((src_ridx, src_cidx), n_blocks_split)

    fnames = [DAT_PATH + "/" + f"MAT_A_{bfp_type.format_name()}_b{b_size}.bin" for b_size in range(n_blocks_split)]
    fps = [open(fname, "w+", encoding='utf-8') for fname in fnames]
    idx_fname = DAT_PATH + "/" + f"IDX_GEN.bin"
    idx_fp = open(idx_fname, "w+", encoding='utf-8')

    f_idx = 0
    for i in bfp_res:
        if bfp_type.is_vec_tail(i, idx_width):
            fps[f_idx].write(i + "\n")
            f_idx = int((f_idx + 1) % n_blocks_split)
        else:
            fps[f_idx].write(i + "\n")

    print("{} lines written to A.".format(len(bfp_res)))
    print(f"mat A total size: {len(bfp_res) * len(bfp_res[0]) / 1024. / 1024. / 8:.2f} MB")

    for f in fps:
        f.close()

    print("generate reduced index...")
    idx_fp.writelines("\n".join(idx_after_redremove))
    idx_fp.close()

    # construct dense mat from selected head to compute gold reference
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
    mat = torch.sparse_coo_tensor(coo_idx, coo_vals, size=(mat_shape, mat_shape)).to_dense().numpy()
    
    return mat

def mat_b_gen(size: tuple, chain_len: int, bfp_type: BFP, n_blocks_split: int = 1):
    # matB = np.random.uniform(low=0., high=1.0, size=size).astype('f')
    # matB = np.random.randint(low=0, high=2, size=size)
    matB = bfp_type.gen_bfp_friendly_data(size)
    print(matB.shape)
    
    # pad mat b to align with chain_len x BFP size
    align_size = chain_len * bfp_type.blk_size()
    required_padding_size = int(align_size - size[0] % align_size)
    if required_padding_size > 0:
        padded_matB = np.pad(
            matB, 
            pad_width=((0, required_padding_size), (0, 0)), 
            mode="constant", 
            constant_values=0.0)
    else:
        padded_matB = matB

    matb_blk_size = math.ceil(size[1] / n_blocks_split)
    for matb_blk_idx in range(n_blocks_split):
        # fetch a block
        blk_size_range_h = matb_blk_idx * matb_blk_idx
        blk_size_range_t = min(blk_size_range_h + matb_blk_size, size[1])
        matb_blk = padded_matB[:, blk_size_range_h:blk_size_range_t]
        # transpose
        chunkedBTrans = np.transpose(matb_blk).reshape(-1, 1, bfp_type.blk_size())
        # bfp conversion
        bfp_res, _ = bfp_type.to_bfp(list(chunkedBTrans))

        fname = DAT_PATH + "/" + f"MAT_B_{bfp_type.format_name()}_b{matb_blk_idx}.bin"
        with open(fname, "w+", encoding='utf-8') as f:
            for i in bfp_res:
                f.write(i + "\n")
            print("{} lines written to B.".format(len(bfp_res)))
            print(f"mat B total size: {len(bfp_res) * len(bfp_res[0]) / 1024. / 1024. / 8 :.2f} MB")

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

def prepare_single_input_files(input_path: str):
    mat_a_files = [input_path + "MAT_A_FP32_{idx}.mem".format(idx=i) for i in range(3)]
    mat_b_files = [input_path + "MAT_B_FP32_{idx}.mem".format(idx=i) for i in range(2)]

    # import A file
    mat_data = []
    for fname in mat_a_files:
        with open(fname, "r", encoding="utf-8") as f:
            lines = f.readlines()
            mat_data += lines

    # import B file
    for fname in mat_b_files:
        with open(fname, "r", encoding="utf-8") as f:
            lines = f.readlines()
            for b_idx, r_idx in itertools.product(range(3), range(len(lines)//3)):
                mat_data.append(lines[r_idx*3+b_idx])

    # split into upper and lower mem files
    upper_mat_data, lower_mat_data = [], []
    for dat in mat_data:
        upper_dw_4bit = (320-256)//4
        upper_mat_data.append("0"*(256//4 - upper_dw_4bit) + dat[0:upper_dw_4bit] + "\n")
        lower_mat_data.append(dat[upper_dw_4bit:-1] + "\n")

    with open(input_path+"onchip_mem_lower_str.mem", "w", encoding="utf-8") as f:
        f.writelines(lower_mat_data)

    with open(input_path+"onchip_mem_upper_str.mem", "w", encoding="utf-8") as f:
        f.writelines(upper_mat_data)

    pass

def main(args: dict):
    if args['inputs_gen']:
        chain_len = int(args['chain_len'])
        hw_row = 6
        hw_col = 12

        matA = mat_a_gen("if2y5NE5b", BFP(BfpType.BFP_12), hw_col)
        matB = mat_b_gen((matA.shape[1], 128), 
                            chain_len, BFP(BfpType.BFP_12), hw_row)
        res = np.matmul(matA, matB)
        print(f"mat a shape: {matA.shape}, mat b shape: {matB.shape}, res shape: {res.shape}")
        np.save("mult_a_b_fp32_res.npy", res)

    if args['outputs-check']:
        fname = str(args['outputs-check'])
        correct_res_filename = str(args['correct_res'])
        check_outputs(fname, correct_res_filename, 1, 1)

    if args['view-npy']:
        fname = str(args['view-npy'])
        res = np.load(fname)
        print(res)

    if args['create-binary']:
        path = str(args['create-binary'])
        prepare_single_input_files(path)

    if args['test']:
        bfp_format = BFP(BfpType.BFP_12)
        res = bfp_format.to_bfp([np.zeros((1, 20), dtype=float)])
        print(res)
  
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
                                action="store", dest="create-binary")
    arg_parser.add_argument("-tt", "--test", help="temp testing entry", \
                                action="store_true", default=False)
    
    args = vars(arg_parser.parse_args())

    if args['inputs_gen'] and args['chain_len'] is None:
        arg_parser.error("inputs generation requires a chain length AND a compute iteration!")

    if args['outputs-check'] and args['correct_res'] is None:
        arg_parser.error("must specify correct result to compare to.")

    main(args)