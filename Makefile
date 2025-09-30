# Compiler and flags
CXX = g++-15
CXXFLAGS = -O3 -march=native -ffast-math
LDFLAGS = 

# Source files
SOURCES = GEMM.cpp GEMM_redRead.cpp cache_aware_gemm.cpp tiling_1D.cpp

# Executable names (remove .cpp extension)
EXECUTABLES = $(SOURCES:.cpp=)

# Default target
all: $(EXECUTABLES)

# Build individual executables
GEMM: GEMM.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS)

GEMM_redRead: GEMM_redRead.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS)

cache_aware_gemm: cache_aware_gemm.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS)

tiling_1D: tiling_1D.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS)

# Clean up object files and executables
clean:
	rm -f $(EXECUTABLES)

# Clean and rebuild
rebuild: clean all

# Run all executables with a test input
test: all
	@echo "Testing GEMM implementations with n=2048..."
	@echo "Running GEMM..."
	@echo "2048" | ./GEMM
	@echo "Running GEMM_redRead..."
	@echo "2048" | ./GEMM_redRead
	@echo "Running cache_aware_gemm..."
	@echo "2048" | ./cache_aware_gemm
	@echo "Running tiling_1D..."
	@echo "2048" | ./tiling_1D

# Debug build
debug: CXXFLAGS += -g -DDEBUG
debug: all

# Release build with optimizations
release: CXXFLAGS += -O3 -DNDEBUG
release: all

# Help target
help:
	@echo "Available targets:"
	@echo "  all      - Build all executables (default)"
	@echo "  clean    - Remove all executables"
	@echo "  rebuild  - Clean and build all executables"
	@echo "  test     - Build and run all executables with test input"
	@echo "  debug    - Build with debug flags"
	@echo "  release  - Build with release optimizations"
	@echo "  help     - Show this help message"

.PHONY: all clean rebuild test debug release help
