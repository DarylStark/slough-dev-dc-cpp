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
    cppcheck \
    pkg-config \
    libgl1-mesa-dev \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libwayland-dev \
    libxkbcommon-dev \
    wayland-protocols

sudo -u developer /home/developer/.local/bin/uv tool upgrade gcovr conan cppman