#matrix matrix multiplication using blas
import numpy as np
import time

n = int(input("Enter the size of the matrix: "))
A = np.random.rand(n, n)
B = np.random.rand(n, n)
#Time taken to multiply the matrices
start_time = time.time()
np.matmul(A, B)
end_time = time.time()
print(f"Time taken: {end_time - start_time} seconds")