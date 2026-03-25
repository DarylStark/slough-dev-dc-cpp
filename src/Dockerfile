# hadolint ignore=DL3007
FROM dast1986/slough-dev-dc-generic-base:1.0.0 AS base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Switch to root user
USER root

# Add testing repo
RUN echo "deb http://deb.debian.org/debian testing main" >> /etc/apt/sources.list.d/testing.list

# Intall C++ tools
# hadolint ignore=DL3008,DL3003,DL4006
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gcc-15 \
    cmake \
    cppcheck \
    gdb \
    valgrind \
    lsb-release \
    wget \
    software-properties-common \
    gnupg \
    ninja-build && \
    wget -nv https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh 22 && \
    apt-get install -y --no-install-recommends \
    clang-tidy-22 \
    clang-format-22 \
    libc++-22-dev \
    libstdc++-16-dev \
    libc++abi-22-dev && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-22 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-22 100 && \
    update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-22 100 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-22 100 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Switch back to developer user
USER developer

# Install gcovr using uv
RUN uv tool install gcovr

# Configure Starship
ENV PROMPTNAME="CPP"

# Set the default command to bash
CMD ["bash"]