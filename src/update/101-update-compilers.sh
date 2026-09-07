#!/bin/bash

set -euo pipefail
shopt -s nullglob

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
lib_dir="$(cd -- "$script_dir/lib" && pwd)"
source "$lib_dir/common.sh"

require_root
print_header "Updating C++ Dev Container / Compilers"

sudo apt update
sudo apt install -y --no-install-recommends \
    gcc-15 \
    clang-tidy-23 \
    clang-format-23 \
    libc++-23-dev \
    libstdc++-16-dev \
    libc++abi-23-dev

sudo update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-16 100