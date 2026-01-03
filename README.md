# Slough - Dev Container - C++

A professional C++ development container image that is part of the Slough project.

## About the Slough Project

The Slough project is an initiative by Daryl Stark to deliver consistent development tooling, including standardized development containers (dev containers) across different programming languages and technology stacks. This project aims to provide developers with ready-to-use, reproducible development environments that work seamlessly across different platforms and operating systems.

## Overview

This repository provides a Docker-based development container specifically configured for C++ development. It includes a comprehensive suite of modern C++ development tools, compilers, debuggers, and utilities to enable productive C++ development right out of the box.

## Using This Container as a Dev Container

### Image Tag

The container image is available at:

```
dast1968/slough-dev-dc-cpp:1.0.0
```

### Setting Up in VS Code

1. **Install Prerequisites:**
   - Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
   - Install [Visual Studio Code](https://code.visualstudio.com/)
   - Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Configure Your Project:**
   
   Create a `.devcontainer/devcontainer.json` file in your project root:

   ```json
   {
     "name": "C++ Development Environment",
     "image": "dast1968/slough-dev-dc-cpp:1.0.0",
     "customizations": {
       "vscode": {
         "extensions": [
           "ms-vscode.cpptools",
           "ms-vscode.cmake-tools"
         ]
       }
     }
   }
   ```

3. **Open in Container:**
   - Open your project in VS Code
   - Press `F1` or `Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac)
   - Type "Dev Containers: Reopen in Container"
   - Select the command and wait for the container to start

## Tips for Working with Dev Containers on Microsoft Windows

### Performance Considerations

- **Use WSL 2:** Ensure Docker Desktop is configured to use the WSL 2 backend for better performance
- **Store Projects in WSL:** For best performance, clone and store your projects in the WSL filesystem (e.g., `\\wsl$\Ubuntu\home\username\projects`) rather than in Windows filesystem
- **File Permissions:** Be aware that file permissions may behave differently between Windows and Linux

### Docker Desktop Configuration

1. **Enable WSL 2 Integration:**
   - Open Docker Desktop Settings
   - Go to "Resources" → "WSL Integration"
   - Enable integration with your WSL 2 distributions

2. **Resource Allocation:**
   - Allocate sufficient memory (at least 4GB recommended for C++ development)
   - Allocate adequate CPU cores for compilation tasks

### Common Windows-Specific Issues

- **Line Endings:** Configure Git to handle line endings properly:
  ```bash
  git config --global core.autocrlf input
  ```

- **Path Issues:** Use forward slashes (`/`) in paths within the container, even when working on Windows

- **Antivirus Interference:** Some antivirus software may slow down Docker. Consider adding Docker directories to exclusion lists

## Container Configuration

### User Account

- **Username:** `developer`
- **Sudo Access:** Full sudo access **without password required**
- **Home Directory:** `/home/developer`

### Important Notes

- The container runs as the `developer` user by default
- You can run administrative commands using `sudo` without entering a password
- Docker socket is mounted to allow Docker-in-Docker operations (when configured)

## Installed Tools

This container includes a comprehensive set of C++ development tools:

### Compilers and Build Tools

- **GCC (GNU Compiler Collection):** The standard GNU C++ compiler
  ```bash
  g++ --version
  g++ myprogram.cpp -o myprogram
  ```

- **Clang/LLVM (Multiple Versions):** Modern C++ compiler with versions 18, 19, 20, and 21
  - Clang 21 is set as the default
  ```bash
  clang++ --version
  clang++ -std=c++20 myprogram.cpp -o myprogram
  ```

- **CMake:** Cross-platform build system generator
  ```bash
  cmake --version
  cmake -B build -S .
  cmake --build build
  ```

- **Ninja:** Fast build system
  ```bash
  ninja --version
  cmake -B build -G Ninja
  ninja -C build
  ```

### Code Quality and Analysis Tools

- **clang-tidy:** Static analysis tool for C++
  ```bash
  clang-tidy --version
  clang-tidy myfile.cpp -- -std=c++20
  ```

- **clang-format:** Code formatting tool
  ```bash
  clang-format --version
  clang-format -i myfile.cpp  # Format in place
  clang-format --style=google myfile.cpp  # Use Google style
  ```

- **cppcheck:** Static analysis tool for C/C++ code
  ```bash
  cppcheck --version
  cppcheck --enable=all --std=c++20 src/
  ```

### Debugging and Profiling Tools

- **GDB (GNU Debugger):** Command-line debugger
  ```bash
  gdb --version
  gdb ./myprogram
  ```

- **Valgrind:** Memory debugging and profiling tool
  ```bash
  valgrind --version
  valgrind --leak-check=full ./myprogram
  ```

### Code Coverage Tools

- **gcovr:** Generate code coverage reports
  ```bash
  gcovr --version
  # Compile with coverage flags
  g++ -fprofile-arcs -ftest-coverage myprogram.cpp -o myprogram
  ./myprogram
  gcovr -r . --html --html-details -o coverage.html
  ```

### C++ Standard Libraries

- **libc++:** LLVM's implementation of the C++ standard library (version 21)
- **libc++abi:** Low-level support for libc++

To use libc++ instead of libstdc++:
```bash
clang++ -stdlib=libc++ myprogram.cpp -o myprogram
```

## Quick Start Example

Here's a quick example of compiling and running a C++ program:

1. Create a simple C++ file:
   ```bash
   cat > hello.cpp << 'EOF'
#include <iostream>
int main() {
    std::cout << "Hello from Slough C++ Dev Container!" << std::endl;
    return 0;
}
EOF
   ```

2. Compile with g++:
   ```bash
   g++ -std=c++20 hello.cpp -o hello
   ./hello
   ```

3. Or compile with clang++:
   ```bash
   clang++ -std=c++20 hello.cpp -o hello
   ./hello
   ```

4. Format your code:
   ```bash
   clang-format -i hello.cpp
   ```

5. Run static analysis:
   ```bash
   clang-tidy hello.cpp -- -std=c++20
   ```

## Building CMake Projects

For projects using CMake:

```bash
# Create build directory
mkdir build && cd build

# Configure with GCC
cmake ..

# Or configure with Clang
cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ ..

# Or use Ninja as the generator
cmake -G Ninja ..

# Build
cmake --build .

# Run tests (if configured)
ctest
```

## Customization

You can extend this container for your specific needs by creating a custom Dockerfile:

```dockerfile
FROM dast1968/slough-dev-dc-cpp:1.0.0

USER root

# Install additional packages
RUN apt-get update && apt-get install -y \
    your-package-here \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER developer
```

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.

## Support and Contributions

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/DarylStark/slough-dev-dc-cpp).

---

**Part of the Slough Project by Daryl Stark**
