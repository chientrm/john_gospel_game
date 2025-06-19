#!/bin/bash
# Build script for Dart+SDL2 FFI project
set -e

# 1. Build native shared library
make -C native

# 2. Compile Dart to native executable
mkdir -p build
dart compile exe bin/mypa.dart -o build/mypa

# 3. Prepare dist folder
mkdir -p dist
cp build/mypa dist/
cp native/libsdl_utils.so dist/

echo "Build complete. Distribution is in the dist/ folder."
