# hadolint ignore=DL3007
FROM dast1986/slough-dev-dc-generic-base:latest AS base

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
    gnupg && \
    wget https://apt.llvm.org/llvm.sh && \
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
    clang-format-18 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Switch back to developer user
USER developer

# Configure Starship
ENV PROMPTNAME="CPP"

# Set the default command to bash
CMD ["bash"]