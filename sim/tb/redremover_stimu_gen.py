import numpy as np
import itertools
from pathlib import Path
from math import ceil, log2
import random

DWIDTH = 9
LAYER = 25
HEAD = 12
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

def gen_data_for_ig_test(attn_fp: str, num_in_lanes: int, res_fp: str = "./ig_stimulus_l25_h14.bin"):
    layer_idx, head_idx = LAYER, HEAD
    block_ids = np.load(attn_fp, allow_pickle=True)
    input_dat_grps, sorted_grps = \
        get_data_from_attn_npy(block_ids[layer_idx][head_idx], num_in_lanes)
    
    res = []
    for input_grp, sorted_grp in zip(input_dat_grps, sorted_grps):
        largest_blk_size = max([len(r) for r in input_grp])
        for i in range(largest_blk_size):
            curr_input = []
            for g_idx in range(num_in_lanes):
                if g_idx > (len(input_grp)-1):
                    curr_input.append(PLACEHOLDER)
                else:
                    if (len(input_grp[g_idx])-1) < i :
                        curr_input.append(PLACEHOLDER)
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
        elif l.strip("\n") == ("1" * DWIDTH * num_out_lanes):
            hw_out_list.append(curr_grp_list[:])
            curr_grp_list = []
        else:
            curr_grp_list = hex_to_idx_list(l.strip("\n")) + curr_grp_list

    # compare hw out with ref out
    mismatched_len = []
    for l_idx, (h, r) in enumerate(zip(hw_out_list, ref)):
        if h != r:
            print(f"l{l_idx}: exact mismatch found!")
            mismatched_len.append(float(len(h) - len(r))/float(len(h)))
        unique_h = list(np.unique(h))
        unique_h.sort()
        if unique_h != r:
            print(f"l{l_idx}: content mismatch found!")

    print(f"average length mismatch: {np.mean(mismatched_len)}")

    return hw_out_list

def main():
    stimu, ref_out = gen_data_for_ig_test(
        f"./attn_blk_idx.npy", 12, f"./ig_stimulus_l{LAYER}_h{HEAD}.bin")
    hw_res = check_idxgen_out_with_ref(Path(f"./idxgen_res_l{LAYER}_h{HEAD}.bin"), ref_out, 16)
    exit()
    # generate stimulus for a single-stage redundancy remover
    gen_dat_a = gen_sorted_dat(6, 8//2, (1, 200))
    gen_dat_b = gen_sorted_dat(6, 8//2, (1, 200))
    write_to_file(gen_dat_a, "./sorted_data_upper.bin")
    write_to_file(gen_dat_b, "./sorted_data_lower.bin")

if __name__ == "__main__":
    main()