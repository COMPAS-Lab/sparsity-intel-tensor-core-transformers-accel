import numpy as np

def create_bfp_array(array, block_size):
    '''
    blocking along the x axis of the array, with the given block size
    '''
    
    pass

def main():
    matA = np.random.uniform(low=1.0, high=2.0, size=(3, 90))
    matB = np.random.uniform(low=1.0, high=2.0, size=(90, 9))
    res = np.matmul(matA, matB)

    
if __name__ == "__main__":
    main()