import numpy as np
import struct
import codecs
import argparse

from torch import chunk

def float_to_hex(f: float):
	# Courtesy of https://stackoverflow.com/a/23624284
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])[2:].zfill(8)

def hex_to_float(x: str):
	# still from stackoverflow
    return struct.unpack('!f', codecs.decode(x,'hex'))[0]

def mat_a_gen(size: tuple, chain_len: int):
    matA = np.random.uniform(low=1.0, high=2.0, size=size).astype('f')
    np.save("mat_a_fp32.npy", matA)

    # prepare mat a
    hexMatARes = []
    chunkedMatA = matA.reshape(3,9,10)
    for currFinishedCol in np.arange(0, chunkedMatA.shape[1], 3, dtype=int):
        for colIdx in np.arange(2, -1, -1,dtype=int):
            for r in range(0, 3):
                # print("assembling chunk r{} c{}".format(r, colIdx+currFinishedCol))
                tempRes = list(map(float_to_hex, chunkedMatA[r][colIdx + currFinishedCol]))
                tempRes = "".join(tempRes)
                # print("res len", len(tempRes))
                hexMatARes.append(tempRes)

    with open("MAT_A_FP32.mem", "w+", encoding='utf-8') as f:
        for i in hexMatARes:
            f.write(i + "\n")
        print("{} lines written to A.".format(len(hexMatARes)))
    
    return matA

def mat_b_gen(size: tuple, chain_len: int):
    matB = np.random.uniform(low=1.0, high=2.0, size=size).astype('f')
    np.save("mat_b_fp32.npy", matB)

    # prepare mat b
    hexMatBRes = []
    chunkedBTrans = np.transpose(matB).reshape(9,9,10)
    for col in range(0,int(9/chain_len)):
        for row in range(0, 9):
            for sub_col in range(0, chain_len):
                print("assembling B chunk r{} c{}".format(col*chain_len+sub_col, row))
                tempRes = list(map(float_to_hex, chunkedBTrans[row][col*chain_len+sub_col]))
                tempRes = "".join(tempRes)
                hexMatBRes.append(tempRes)

    with open("MAT_B_FP32.mem", "w+", encoding="utf-8") as f:
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
    
    print(sim_out)
    print("-"*8)
    print(original)

def main(args: dict):
    if args['inputs_gen']:
        matA = mat_a_gen((3, 90), chain_len=3)
        matB = mat_b_gen((90, 9), chain_len=3)
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
    arg_parser.add_argument("-ot", "--outputs-translate", help="translate the output file to floats", \
                                action="store", dest="outputs-translate")
    arg_parser.add_argument("-v", "--view-npy", help="view numpy file", \
                                action="store", dest="view-npy")
    
    args = vars(arg_parser.parse_args())
    main(args)