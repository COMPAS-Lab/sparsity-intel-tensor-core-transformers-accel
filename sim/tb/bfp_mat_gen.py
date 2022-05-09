import numpy as np
import struct
import codecs
import argparse
import math
import itertools

def float_to_hex(f: float):
	# Courtesy of https://stackoverflow.com/a/23624284
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])[2:].zfill(8)

def hex_to_float(x: str):
	# still from stackoverflow
    return struct.unpack('!f', codecs.decode(x,'hex'))[0]

def mat_a_gen(size: tuple, chain_len: int, compute_iter: int):
    # matA = np.random.uniform(low=1.0, high=15.0, size=size).astype('f')
    matA = np.array(list(range(size[0]*size[1]))) / 100.0
    matA = matA.reshape(size)
    np.save("mat_a_fp32.npy", matA)
    
    # blocking the matrix A for tensor core array test
    aBlocks = np.split(matA, math.ceil(matA.shape[0]/3), axis=0)
    for idx, aBlock in enumerate(aBlocks):
        # prepare mat a
        hexMatARes = []
        # each iteration, the chain finishes 3x(chain_lenx10) elements in A
        chunkedMatA = aBlock.reshape(3,compute_iter*chain_len,10)
        # send each group of A iteratively
        for currFinishedCol in np.arange(0, chunkedMatA.shape[1], chain_len, dtype=int):
            # fill the chain reversely, so A's first column is in the first
            # tensor core, and last column the last tensor core
            for colIdx in np.arange(2, -1, -1,dtype=int):
                # load 3 banks of the cache for each tensor core
                for r in range(0, 3):
                    # print("assembling chunk r{} c{}".format(r, colIdx+currFinishedCol))
                    tempRes = list(map(float_to_hex, chunkedMatA[r][colIdx + currFinishedCol]))
                    tempRes = "".join(tempRes)
                    # print("res len", len(tempRes))
                    hexMatARes.append(tempRes)

        fname = "MAT_A_FP32_{}.mem".format(idx) if len(aBlock) > 1 else "MAT_A_FP32.mem"
        with open(fname, "w+", encoding='utf-8') as f:
            for i in hexMatARes:
                f.write(i + "\n")
            print("{} lines written to A.".format(len(hexMatARes)))
    
    return matA

def mat_b_gen(size: tuple, chain_len: int, compute_iter: int):
    # matB = np.random.uniform(low=1.0, high=15.0, size=size).astype('f')
    matB = np.array(list(range(size[0]*size[1]))) / 100.0
    matB = matB.reshape(size)
    np.save("mat_b_fp32.npy", matB)
    
    bBlocks = np.split(matB, math.ceil(matB.shape[1]/(3*chain_len)), axis=1)
    for idx, bBlock in enumerate(bBlocks):
        # prepare mat b
        hexMatBRes = []
        # as B is fed along the column axis, transpose B first
        # each iteration, the chain finishes nx10 elements, 
        # where n >= chain load latency.
        chunkedBTrans = np.transpose(bBlock).reshape(bBlock.shape[1],chain_len*compute_iter,10)
        # B is divided into chain_lenxcompute_iter blocks, each compute_iter
        # contains (chain_lenx10)x(chain_lenx3) elements
        for col in range(0,compute_iter):
            # each iteration, the chain consumes chain_lenx3 original cols to 
            # hide the load latency
            for row in range(0, chain_len*3):
                # each block of an original col contains chain_lenx10 elements
                for sub_col in range(0, chain_len):
                    # print("assembling B chunk r{} c{}".format(col*chain_len+sub_col, row))
                    tempRes = list(map(float_to_hex, chunkedBTrans[row][col*chain_len+sub_col]))
                    tempRes = "".join(tempRes)
                    hexMatBRes.append(tempRes)

        fname = "MAT_B_FP32_{}.mem".format(idx) if len(bBlocks) > 1 else "MAT_B_FP32.mem"
        with open(fname, "w+", encoding="utf-8") as f:
            for i in hexMatBRes:
                f.write(i + "\n")
            print("{} lines written to B.".format(len(hexMatBRes)))

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

        matA = mat_a_gen((3*50, chain_len*10*matAColSubGrpLen), \
                            chain_len, matAColSubGrpLen)
        matB = mat_b_gen((chain_len*10*matAColSubGrpLen, 3*chain_len*5), 
                            chain_len, matAColSubGrpLen)
        res = np.matmul(matA, matB)
        np.save("mult_a_b_fp32_res.npy", res)

    if args['outputs-check']:
        fname = str(args['outputs-check'])
        correct_res_filename = str(args['correct_res'])
        check_outputs(fname, correct_res_filename, 2, 3)

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