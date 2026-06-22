#!/bin/bash

set -euo pipefail
shopt -s nullglob

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
lib_dir="$(cd -- "$script_dir/lib" && pwd)"
source "$lib_dir/common.sh"

require_root
print_header "Updating C++ Dev Container / Tools"

sudo apt update
sudo apt install -y --no-install-recommends \
    doxygen \
    valgrind \
    cmake \
    cppcheck

sudo -u developer /home/developer/.local/bin/uv tool upgrade gcovr conan