import numpy as np
import struct
import codecs
import argparse
import math

def float_to_hex(f: float):
	# Courtesy of https://stackoverflow.com/a/23624284
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])[2:].zfill(8)

def hex_to_float(x: str):
	# still from stackoverflow
    return struct.unpack('!f', codecs.decode(x,'hex'))[0]

def mat_a_gen(size: tuple, chain_len: int, compute_iter: int):
    matA = np.random.uniform(low=1.0, high=2.0, size=size).astype('f')
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
    matB = np.random.uniform(low=1.0, high=2.0, size=size).astype('f')
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

def check_outputs(sim_out_fname: str):
    sim_out = []
    with open(sim_out_fname, "r", encoding="utf-8") as f:
        lines = f.readlines()
        sim_out = [hex_to_float(l[0:-1]) for l in lines if "//" not in l]
        sim_out = np.array(sim_out)

    original = np.load("mult_a_b_fp32_res.npy")
    sim_out_shape = (original.shape[1], original.shape[0])
    # reshape to be the same as original
    sim_out = sim_out.reshape(sim_out_shape).transpose()
    # revert along y axis
    sim_out = sim_out[::-1,:]

    err = np.divide(np.abs(np.subtract(sim_out, original)), original)
    
    print("max err: ", np.max(err))
    print("min err: ", np.min(err))
    print("average err: ", np.mean(err))

def main(args: dict):
    if args['inputs_gen']:
        chain_len = int(args['chain_len'])
        compute_iter = int(args['compute_iter'])
        matA = mat_a_gen((9, chain_len*10*compute_iter), \
                            chain_len, compute_iter)
        matB = mat_b_gen((chain_len*10*compute_iter, 3*chain_len*2), 
                            chain_len, compute_iter)
        res = np.matmul(matA, matB)
        np.save("mult_a_b_fp32_res.npy", res)

    if args['outputs-translate']:
        fname = str(args['outputs-translate'])
        check_outputs(fname)

    if args['view-npy']:
        fname = str(args['view-npy'])
        res = np.load(fname)
        print(res)
  
if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("-ig", "--inputs-gen", help="generate mat a and b inputs for simulation", \
                                action="store_true", dest="inputs_gen")
    arg_parser.add_argument("-cl", "--chain-len", help="chain length", \
                                action="store", dest="chain_len")
    arg_parser.add_argument("-ci", "--compute-iter", help="compute iteration", \
                                action="store", dest="compute_iter")
    arg_parser.add_argument("-ot", "--outputs-translate", help="translate the output file to floats", \
                                action="store", dest="outputs-translate")
    arg_parser.add_argument("-v", "--view-npy", help="view numpy file", \
                                action="store", dest="view-npy")
    
    args = vars(arg_parser.parse_args())

    if args['inputs_gen'] and (args['chain_len'] is None or args['compute_iter'] is None):
        arg_parser.error("inputs generation requires a chain length AND a compute iteration!")

    main(args)