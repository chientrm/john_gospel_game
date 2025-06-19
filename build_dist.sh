#!/bin/bash
# Build script for Dart+SDL2 FFI project with assets support
set -e

# 1. Build native shared library
make -C native

# 2. Compile Dart to native executable
mkdir -p build
dart compile exe bin/john_gospel_game.dart -o build/john_gospel_game

# 3. Prepare dist folder
mkdir -p dist
cp build/john_gospel_game dist/
cp native/libsdl_utils.so dist/

# 4. Copy assets
mkdir -p dist/assets
cp -r assets/* dist/assets/

echo "Build complete. Distribution is in the dist/ folder."
