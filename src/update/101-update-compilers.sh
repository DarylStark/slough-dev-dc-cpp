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
    clang-tidy-22 \
    clang-format-22 \
    libc++-22-dev \
    libstdc++-16-dev \
    libc++abi-22-dev