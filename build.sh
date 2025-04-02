#!/usr/bin/bash

CLANG=riscv64-unknown-linux-gnu-clang
CLANGXX=riscv64-unknown-linux-gnu-clang++

CC=riscv64-unknown-linux-gnu-clang
CXX=riscv64-unknown-linux-gnu-clang++

CLANG_FLAGS="-march=rv64gcv_zbb -fno-rtti -mrvv-vector-bits=128"


rm -rf build_rv
mkdir build_rv && cd build_rv
cmake .. \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_C_COMPILER=$CLANG \
  -DCMAKE_CXX_COMPILER=$CLANGXX \
  -DSNAPPY_BUILD_TESTS=OFF -DSNAPPY_BUILD_BENCHMARKS=ON \
  -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_C_FLAGS="$CLANG_FLAGS" \
  -DCMAKE_CXX_FLAGS="$CLANG_FLAGS  -std=c++11" \
  -DCMAKE_CXX_STANDARD=11
#  -DCMAKE_EXE_LINKER_FLAGS="-static"
  
