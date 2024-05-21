import numpy as np
import struct
import codecs
import argparse
import math
import itertools
from enum import Enum

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

    def to_bfp(self, blk_list: list) -> list:
        res = []

        for hex_l in blk_list:
            blk_elems = [hex_l[start : start + 8] for start in range(0, self.blk_size() * 8, 8)]
            exps = [int(hex_to_bin(e, 32)[1:9], 2) for e in blk_elems]
            mants = [hex_to_bin(e, 32)[9:9+self.mant_bits()+1] for e in blk_elems]
            signs = [hex_to_bin(e, 32)[0] for e in blk_elems]
            
            blk_res = bin(max(exps)-2)[2:].zfill(8)

            for i in range(len(blk_elems)):
                mant_with_sign = "0" * (self.mant_bits() + 2) \
                    if blk_elems[i] == "00000000" else "1" + mants[i]
                shifted_mant = "0" * (self.mant_bits() + 2) \
                    if (max(exps) - exps[i]) > len(mant_with_sign) \
                    else mant_with_sign[0:len(mant_with_sign) - (max(exps) - exps[i]) + 1].zfill(len(mant_with_sign))
                final_mant = twos_comp(shifted_mant, signs[i])[0:self.mant_bits() + 1]
                blk_res += final_mant

            res.append(blk_res)
                
        return res
    
    def gen_bfp_friendly_data(self, size: tuple):
        gen_mask = np.random.randint(low=0, high=len(self.randgen_cand), size=size)
        res = np.zeros(size, dtype=float)
        for i in range(len(self.randgen_cand)):
            res[np.where(gen_mask == i)] = self.randgen_cand[i]

        return res

def mat_a_gen(three_vec_len: int, chain_len: int, bfp_type: BFP):
    '''
    assuming mat A is a 3xthree_vec_len mat block:
    '''
    matA = bfp_type.gen_bfp_friendly_data((3, three_vec_len))

    # matA = np.array(list(range(3 * three_vec_len))) / 100.0
    # matA = matA.reshape((3, three_vec_len))
    np.save("mat_a_fp32.npy", matA)

    compute_iter = math.ceil(float(three_vec_len) / float(chain_len) / 20)
    
    # prepare mat a
    hexMatARes = []
    # each iteration, the chain finishes 3x(chain_lenx10) elements in A
    chunkedMatA = matA.reshape(3, compute_iter * chain_len, bfp_type.blk_size())
    # send each group of A iteratively
    for currFinishedCol in np.arange(0, chunkedMatA.shape[1], chain_len, dtype=int):
        # fill the chain reversely, so A's first column is in the first
        # tensor core, and last column the last tensor core
        for colIdx in np.arange(chain_len-1, -1, -1, dtype=int):
            # load 3 banks of the cache for each tensor core
            for r in range(0, 3):
                # print("assembling chunk r{} c{}".format(r, colIdx+currFinishedCol))
                tempRes = list(map(float_to_hex, chunkedMatA[r][colIdx + currFinishedCol]))
                tempRes = "".join(tempRes)
                # print("res len", len(tempRes))
                hexMatARes.append(tempRes)

    fname = "MAT_A_FP32.hex"
    with open(fname, "w+", encoding='utf-8') as f:
        for i in hexMatARes:
            f.write(i + "\n")
        print("{} lines written to A.".format(len(hexMatARes)))

    # bfp conversion
    bfp_coverted = bfp_type.to_bfp(hexMatARes)
    fname = f"MAT_A_{bfp_type.format_name()}.bin"
    with open(fname, "w+", encoding='utf-8') as f:
        for i in bfp_coverted:
            f.write(i + "\n")
        print("{} lines written to A.".format(len(bfp_coverted)))
    
    return matA

def mat_b_gen(size: tuple, chain_len: int, bfp_type: BFP):
    # matB = np.random.uniform(low=0., high=1.0, size=size).astype('f')
    # matB = np.random.randint(low=0, high=2, size=size)
    matB = bfp_type.gen_bfp_friendly_data(size)
    print(matB.shape)
    np.save("mat_b_fp32.npy", matB)
    
    # prepare mat b
    hexMatBRes = []
    chunkedBTrans = np.transpose(matB).reshape(size[1], -1, chain_len, bfp_type.blk_size())
    for iter in range(chunkedBTrans.shape[1]):
        # each iteration, the chain consumes chain_lenx3 original cols to 
        # hide the load latency
        for r in range(chunkedBTrans.shape[0]):
            # each block of an original col contains chain_lenx10 elements
            para_input_grp = ""
            for sub_col in range(chain_len):
                # print("assembling B chunk r{} c{}".format(col*chain_len+sub_col, row))
                tempRes = list(map(float_to_hex, chunkedBTrans[r][iter][sub_col]))
                tempRes = "".join(tempRes)
                para_input_grp += tempRes
            
            hexMatBRes.append(para_input_grp)

    fname = "MAT_B_FP32.hex"
    with open(fname, "w+", encoding="utf-8") as f:
        for i in hexMatBRes:
            f.write(i + "\n")
        print("{} lines written to B.".format(len(hexMatBRes)))

    # bfp conversion
    bfp_res = []
    for i in hexMatBRes:
        blk_grp = [i[b*20*8:(b+1)*20*8] for b in range(chain_len)]
        bfp_blk_res = bfp_type.to_bfp(blk_grp)
        bfp_res.append("".join(bfp_blk_res))

    fname = f"MAT_B_{bfp_type.format_name()}.bin"
    with open(fname, "w+", encoding='utf-8') as f:
        for i in bfp_res:
            f.write(i + "\n")
        print("{} lines written to B.".format(len(bfp_res)))
    

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
        matAColSubGrpLen = int(args['compute_iter'])

        matA = mat_a_gen(chain_len * 20 * matAColSubGrpLen, \
                            chain_len, BFP(BfpType.BFP_12))
        matB = mat_b_gen((chain_len * 20 * matAColSubGrpLen, 32), 
                            chain_len, BFP(BfpType.BFP_12))
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
    
    args = vars(arg_parser.parse_args())

    if args['inputs_gen'] and (args['chain_len'] is None or args['compute_iter'] is None):
        arg_parser.error("inputs generation requires a chain length AND a compute iteration!")

    if args['outputs-check'] and args['correct_res'] is None:
        arg_parser.error("must specify correct result to compare to.")

    main(args)