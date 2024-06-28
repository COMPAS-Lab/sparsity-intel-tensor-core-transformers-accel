import numpy as np
import itertools
from pathlib import Path
from math import ceil, log2
import random
import argparse
import os
import re

DWIDTH = 9
PLACEHOLDER="1"*DWIDTH

def get_data_from_attn_npy(ids: np.array, num_in_lanes: int):
    all_row_idx = np.unique([r[0] for r in ids])
    split_ridx_list = [(i + 1) * num_in_lanes for i in range(ceil(float(all_row_idx.shape[0]) / num_in_lanes))]
    row_grps = np.split(all_row_idx, split_ridx_list[0:-1])
    
    input_grps, sorted_res = [], []
    for rgrp in row_grps:
        curr_grp_inputs = []
        for r in rgrp:
            selected_blocks = [blk[1]//20 for blk in ids if blk[0] == r]
            selected_blocks.sort(reverse=True)
            curr_grp_inputs.append(selected_blocks)

        input_grps.append(curr_grp_inputs)
        curr_sorted_res = list(np.unique(list(itertools.chain(*curr_grp_inputs))))
        curr_sorted_res.sort()
        sorted_res.append(curr_sorted_res)

    max_idx = max([r[1]//20 for r in ids])
    dwidth = 1 + int(ceil(log2(max_idx)))
    print(f"max val: {max_idx}, select dwidth = {dwidth}")
    global DWIDTH
    DWIDTH = dwidth

    return input_grps, sorted_res

def gen_data_for_ig_test(attn_fp: str, num_in_lanes: int, res_fp: str, l_idx, h_idx):
    block_ids = np.load(attn_fp, allow_pickle=True)
    input_dat_grps, sorted_grps = \
        get_data_from_attn_npy(block_ids[l_idx][h_idx], num_in_lanes)
    
    res = []
    for input_grp, sorted_grp in zip(input_dat_grps, sorted_grps):
        largest_blk_size = max([len(r) for r in input_grp])
        grp_minval_pad = min([min(i) for i in input_grp])
        for i in range(largest_blk_size):
            curr_input = []
            for g_idx in range(num_in_lanes):
                if g_idx > (len(input_grp)-1):
                    curr_input.append(PLACEHOLDER)
                else:
                    if (len(input_grp[g_idx])-1) < i :
                        # curr_input.append(PLACEHOLDER)
                        min_bin = bin(grp_minval_pad)[2:].zfill(DWIDTH)
                        curr_input.append("1" + min_bin[1:])
                    else:
                        tmp_bin = bin(input_grp[g_idx][i])[2:].zfill(DWIDTH)
                        curr_input.append(tmp_bin)

            curr_input_bin = "".join(curr_input)
            res.append(curr_input_bin)

        # output divider and current group
        res.append(PLACEHOLDER * num_in_lanes)

    with Path(res_fp).open("w") as f:
        f.writelines([r + "\n" for r in res])
    return res, sorted_grps

def gen_sorted_dat(iters: int, in_size: int, gen_range: tuple):
    cand_list = list(np.arange(gen_range[0], gen_range[1], 1))
    ori_data = random.sample(cand_list, in_size * iters)
    ori_data = np.sort(ori_data).reshape(iters, -1)
    print(ori_data[::-1])
    return ori_data[::-1]

def write_to_file(data: np.array, fp: str):
    with Path(fp).open("w") as f:
        for iter in data:
            dat_per_iter = [bin(e)[2:].zfill(DWIDTH) for e in iter]
            dat_per_iter_hex = " ".join(dat_per_iter)
            f.write(dat_per_iter_hex + "\n")

def check_idxgen_out_with_ref(fp_hw_out: Path, ref: list, num_out_lanes: int): 
    # translate hw out as list
    with fp_hw_out.open("r") as fp:
        hw_out = fp.readlines()

    def hex_to_idx_list(line: str):
        sub_outs = [line[DWIDTH*i:DWIDTH*(i+1)] for i in range(num_out_lanes)]
        sub_outs = [i for i in sub_outs if i != PLACEHOLDER]
        sub_outs_int = [int(i, 2) for i in sub_outs]
        return sub_outs_int
    
    hw_out_list, curr_grp_list = [], []
    for l in hw_out:
        if l[0:2] == "//":
            continue
        elif l.strip("\n") == ("0" * DWIDTH * num_out_lanes):
            hw_out_list.append(curr_grp_list[:])
            curr_grp_list = []
        else:
            curr_grp_list = hex_to_idx_list(l.strip("\n")) + curr_grp_list

    # compare hw out with ref out
    mismatched_len = []
    for l_idx, (h, r) in enumerate(zip(hw_out_list, ref)):
        if h != r:
            print(f"l{l_idx}: exact mismatch found!")
            print(f"hw out: {h}\nref: {r}")

        mismatched_len.append(float(len(h) - len(r))/float(len(r)))
        unique_h = list(np.unique(h))
        unique_h.sort()
        if unique_h != r:
            print(f"l{l_idx}: content mismatch found!")

    print(f"average length mismatch: {np.mean(mismatched_len)}")

    return np.mean(mismatched_len)

def main():
    l_idx, h_idx = -1, -1

    arg_parser = argparse.ArgumentParser(prog="redundancy removal simugen")
    arg_parser.add_argument('--generate', action='store_true')
    arg_parser.add_argument('--verify', action='store_true')
    arg_parser.add_argument('--gui', action='store_true')
    arg_parser.add_argument('--layer', type=int, default=-1)
    arg_parser.add_argument('--head', type=int, default=-1)
    arg_parser.add_argument('--auto', action="store_true")
    arg_parser.add_argument('--fromlist', action="store_true")
    args = arg_parser.parse_args()

    if args.layer != -1:
        l_idx = args.layer
    if args.head != -1:
        h_idx = args.head

    if args.generate:
        stimu, ref_out = gen_data_for_ig_test(
            f"./tb/idxgen_stimu/attn_blk_idx.npy", 12, 
            f"./tb/idxgen_stimu/ig_stimulus_l{l_idx}_h{h_idx}.bin")
        print(f"#inputs: {len(stimu)}")

    if args.verify:
        stimu, ref_out = gen_data_for_ig_test(
            f"./tb/idxgen_stimu/attn_blk_idx.npy", 12, 
            f"./tb/idxgen_stimu/ig_stimulus_l{l_idx}_h{h_idx}.bin",
            l_idx, h_idx)
        print(f"python: simulating l{l_idx}h{h_idx}...")
        os.environ["SPAR_IDXGEN_LAYER"] = str(l_idx)
        os.environ["SPAR_IDXGEN_HEAD"] = str(h_idx)
        os.environ["SPAR_IDXGEN_INSIZE"] = str(len(stimu))
        if (len(stimu) > 7000):
            raise ValueError("insufficient input vector length found in HW")
        
        os.system("vsim -do idxgen_tb_start.do")
        hw_res_err_rate = check_idxgen_out_with_ref(
            Path(f"./tb/idxgen_stimu/idxgen_res_l{l_idx}_h{h_idx}.bin"), 
            ref_out, 12)
    
    if args.auto:
        nlayer, nheads = 28, 32
        heads_failed = []
        for l_idx, h_idx in itertools.product(range(nlayer), range(nheads)):
            print(f"python: simulating l{l_idx}h{h_idx}...")
            stimu, ref_out = gen_data_for_ig_test(
                f"./tb/idxgen_stimu/attn_blk_idx.npy", 12, 
                f"./tb/idxgen_stimu/ig_stimulus_l{l_idx}_h{h_idx}.bin", 
                l_idx, h_idx)
            os.environ["SPAR_IDXGEN_LAYER"] = str(l_idx)
            os.environ["SPAR_IDXGEN_HEAD"] = str(h_idx)
            os.environ["SPAR_IDXGEN_INSIZE"] = str(len(stimu))
            if (len(stimu) > 7000):
                raise ValueError("insufficient input vector length found in HW")
            
            os.system("vsim -c -do idxgen_tb_start.do")
            hw_res_err_rate = check_idxgen_out_with_ref(
                Path(f"./tb/idxgen_stimu/idxgen_res_l{l_idx}_h{h_idx}.bin"), 
                ref_out, 12)
            if(abs(hw_res_err_rate) > 0.0):
                failed_head = (f"l{l_idx}h{h_idx}", hw_res_err_rate)
                with open("./tb/idxgen_stimu/heads_failed.txt", "a+") as f:
                    f.write(f"{failed_head}\n")
                heads_failed.append(failed_head)

    if args.fromlist:
        hlist_file = "./tb/idxgen_stimu/heads_failed_old.txt"
        head_list = []

        with Path(hlist_file).open("r") as hf:
            for r in hf.readlines():
                tmp = r.strip().strip("()").split(",")[0]
                head_list.append(list(map(int, re.findall(r'\d+', tmp))))

        for helem in head_list:
            l_idx, h_idx = helem[0], helem[1]
            print(f"python: simulating l{l_idx}h{h_idx}...")
            stimu, ref_out = gen_data_for_ig_test(
                f"./tb/idxgen_stimu/attn_blk_idx.npy", 12, 
                f"./tb/idxgen_stimu/ig_stimulus_l{l_idx}_h{h_idx}.bin", 
                l_idx, h_idx)
            os.environ["SPAR_IDXGEN_LAYER"] = str(l_idx)
            os.environ["SPAR_IDXGEN_HEAD"] = str(h_idx)
            os.environ["SPAR_IDXGEN_INSIZE"] = str(len(stimu))
            if (len(stimu) > 7000):
                raise ValueError("insufficient input vector length found in HW")
            
            os.system("vsim -c -do idxgen_tb_start.do")
            hw_res_err_rate = check_idxgen_out_with_ref(
                Path(f"./tb/idxgen_stimu/idxgen_res_l{l_idx}_h{h_idx}.bin"), 
                ref_out, 12)
            if(abs(hw_res_err_rate) > 0.0):
                failed_head = (f"l{l_idx}h{h_idx}", hw_res_err_rate)
                with open("./tb/idxgen_stimu/heads_failed.txt", "a+") as f:
                    f.write(f"{failed_head}\n")

    # generate stimulus for a single-stage redundancy remover
    # gen_dat_a = gen_sorted_dat(6, 8//2, (1, 200))
    # gen_dat_b = gen_sorted_dat(6, 8//2, (1, 200))
    # write_to_file(gen_dat_a, "./sorted_data_upper.bin")
    # write_to_file(gen_dat_b, "./sorted_data_lower.bin")

if __name__ == "__main__":
    main()
