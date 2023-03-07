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
