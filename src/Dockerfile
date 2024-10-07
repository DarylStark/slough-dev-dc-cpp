# hadolint ignore=DL3007
FROM dast1986/slough-dev-dc-generic-base:latest AS base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Switch to root user
USER root

# Intall C++ tools
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    cppcheck \
    gdb \
    valgrind \
    clang-tidy \
    clang-format && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Switch back to developer user
USER developer

# Configure Starship
ENV PROMPTNAME="CPP"

# Set the default command to bash
CMD ["bash"]