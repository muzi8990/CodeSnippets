# [CMake](https://cmake.org/)

+ [Download | CMake](https://cmake.org/download/)
  + [Files｜CMake](https://cmake.org/files/)
+ [Documentation | CMake](https://cmake.org/documentation/)
  + [FAQ](https://gitlab.kitware.com/cmake/community/-/wikis/FAQ)
+ [GitHub Mirror｜CMake](https://github.com/Kitware/CMake)

+ [Installation of CMake](https://www.linuxfromscratch.org/blfs/view/svn/general/cmake.html)

## Pre-installation Actions on CentOS

```shell
sudo yum update -y
sudo yum group install "Development Tools" -y
```

## Compile from source and install

+ [Install CMake on CentOS 7.](https://gist.github.com/1duo/38af1abd68a2c7fe5087532ab968574e)

```shell
wget https://github.com/Kitware/CMake/releases/download/v3.26.0-rc5/cmake-3.26.0-rc5.tar.gz
tar zxvf cmake-3.*
cd cmake-3.*
./bootstrap --prefix=/usr/local
make -j$(nproc)
sudo make install

# Validate installation
cmake --version
```

## Commands

+ [find_package](https://cmake.org/cmake/help/latest/command/find_package.html)
  + [使用find_package引入外部依赖包](https://github.com/BrightXiaoHan/CMakeTutorial/tree/master/FindPackage)

## Variables

+ [CMAKE_PREFIX_PATH](https://cmake.org/cmake/help/latest/variable/CMAKE_PREFIX_PATH.html)
+ [CMAKE_BUILD_TYPE](https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_TYPE.html)
+ [CMAKE_INCLUDE_PATH](https://cmake.org/cmake/help/latest/variable/CMAKE_INCLUDE_PATH.html)
+ [CMAKE_LIBRARY_PATH](https://cmake.org/cmake/help/latest/variable/CMAKE_LIBRARY_PATH.html)
+ [CMAKE_INSTALL_PREFIX](https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX.html)

## Modules

+ [FindTensorRT.cmake](https://gist.github.com/OlivierLDff/aafaee8373a2337fef8cd5d2ece973c7)
+ [FindMKL.cmake](https://github.com/facebookresearch/faiss/blob/main/cmake/FindMKL.cmake)
+ [set_ifndef.cmake](https://github.com/NVIDIA/TensorRT/blob/main/cmake/modules/set_ifndef.cmake)
  
## Questions

+ [How can I get CMake to automatically detect the value for CUDA_ARCHITECTURES?](https://stackoverflow.com/questions/68223398/how-can-i-get-cmake-to-automatically-detect-the-value-for-cuda-architectures)
