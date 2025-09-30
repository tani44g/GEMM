# GEMM
- gemm using numpy took 0.015s (uses BLAS library)
- simple gemm took without any compiler flags took 32.589s
- gemm_redR where we reduce 1 read of C took 22.7s
- gemm compiled with flags -O3 and -march=native took 1.5s with or without 1 read reduction of C
- loop interchanged gemm in which cache misses are reduced took 0.668s - reason simd + cache miss reduction
- No changes in tiling1D
> **Note:** All timings above are for square matrices of size 1024 × 1024.

