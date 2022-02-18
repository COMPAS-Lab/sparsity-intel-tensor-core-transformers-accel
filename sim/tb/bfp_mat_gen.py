from asyncio import streams
import numpy as np
import struct
import codecs

from torch import double


def float_to_hex(f: float):
	# Courtesy of https://stackoverflow.com/a/23624284
	return hex(struct.unpack('<I', struct.pack('<f', f))[0])[2:].zfill(8)

def hex_to_float(x: str):
	# still from stackoverflow
    return struct.unpack('!f', codecs.decode(x,'hex'))[0]


def main():
    matA = np.random.uniform(low=1.0, high=2.0, size=(3, 90)).astype('f')
    matB = np.random.uniform(low=1.0, high=2.0, size=(90, 9)).astype('f')
    res = np.matmul(matA, matB)
    np.save("mult_a_b_fp32_res.npy", res)

    # prepare mat a
    hexMatARes = []
    chainLen = 3
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
    
    # prepare mat b
    hexMatBRes = []
    chunkedBTrans = np.transpose(matB).reshape(9,9,10)
    for col in range(0,int(9/chainLen)):
        for row in range(0, 9):
            for sub_col in range(0, chainLen):
                print("assembling B chunk r{} c{}".format(col*chainLen+sub_col, row))
                tempRes = list(map(float_to_hex, chunkedBTrans[row][col*chainLen+sub_col]))
                tempRes = "".join(tempRes)
                hexMatBRes.append(tempRes)

    with open("MAT_B_FP32.mem", "w+", encoding="utf-8") as f:
        for i in hexMatBRes:
            f.write(i + "\n")
        print("{} lines written to B.".format(len(hexMatBRes)))

if __name__ == "__main__":
    main()