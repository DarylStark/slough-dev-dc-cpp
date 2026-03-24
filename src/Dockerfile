# hadolint ignore=DL3007
FROM dast1986/slough-dev-dc-generic-base:1.0.0 AS base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Switch to root user
USER root

# Intall C++ tools
# hadolint ignore=DL3008,DL3003,DL4006
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    cppcheck \
    gdb \
    valgrind \
    lsb-release \
    wget \
    software-properties-common \
    gnupg \
    ninja-build \
    gcovr \
    gcc-14 \
    g++-14 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100 && \
    wget -nv https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh 21 && \
    ./llvm.sh 20 && \
    ./llvm.sh 19 && \
    ./llvm.sh 18 && \
    apt-get install -y --no-install-recommends \
    clang-tidy-21 \
    clang-format-21 \
    clang-tidy-20 \
    clang-format-20 \
    clang-tidy-19 \
    clang-format-19 \
    clang-tidy-18 \
    clang-format-18 \
    libc++-21-dev \
    libc++abi-21-dev && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-21 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-21 100 && \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-21 100 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-21 100 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Switch back to developer user
USER developer

# Configure Starship
ENV PROMPTNAME="CPP"

# Set the default command to bash
CMD ["bash"]