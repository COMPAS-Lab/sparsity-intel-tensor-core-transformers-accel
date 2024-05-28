import numpy as np
from pathlib import Path
from math import ceil
from enum import Enum
import random

DWIDTH = 11

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

def main():
    gen_dat_a = gen_sorted_dat(6, 8//2, (1, 200))
    gen_dat_b = gen_sorted_dat(6, 8//2, (1, 200))
    write_to_file(gen_dat_a, "./sorted_data_upper.bin")
    write_to_file(gen_dat_b, "./sorted_data_lower.bin")

if __name__ == "__main__":
    main()