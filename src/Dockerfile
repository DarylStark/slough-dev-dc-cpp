# hadolint ignore=DL3007
FROM dast1986/slough-dev-dc-generic-base:1.0.4 AS base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Switch to root user
USER root

# Add testing repo
RUN echo "deb http://deb.debian.org/debian testing main" >> /etc/apt/sources.list.d/testing.list && \
    mkdir -p /etc/dpkg/dpkg.cfg.d && echo "force-overwrite" > /etc/dpkg/dpkg.cfg.d/force-overwrite

# Intall C++ tools
# hadolint ignore=DL3008,DL3003,DL4006
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gcc-16 \
    g++-16 \
    cmake \
    cppcheck \
    gdb \
    valgrind \
    lsb-release \
    wget \
    software-properties-common \
    gnupg \
    doxygen \
    ninja-build \
    pkg-config \
    libgl1-mesa-dev \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libwayland-dev \
    libxkbcommon-dev \
    wayland-protocols && \
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
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-16 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-16 100 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Switch back to developer user

USER developer

# Install Python-based tools using uv
RUN uv tool install gcovr && uv tool install conan && uv tool install cppman

# Configure Conan
RUN conan profile detect --force && \
    echo "tools.system.package_manager:mode = install" >> ~/.conan2/global.conf && \
    echo "tools.system.package_manager:sudo = True" >> ~/.conan2/global.conf

# Configure Starship
ENV PROMPTNAME="CPP"

# Add update scripts
COPY ./update/ /opt/update-dc/

# Update the system
# hadolint ignore=DL3004
RUN sudo /opt/update-dc/000-update-dev-dc.sh

# Set the default command to bash
CMD ["bash"]