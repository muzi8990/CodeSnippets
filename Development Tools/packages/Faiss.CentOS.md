# Faiss

+ [how to Compile Faiss using static MKL](https://github.com/facebookresearch/faiss/issues/96)
+ [Compiling the python interface within an Anaconda install](https://github.com/facebookresearch/faiss/wiki/Installing-Faiss)

## pcre2

```shell
wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.gz

sudo yum install readline-devel -y
tar zxvf pcre2-10.*
cv pcre2-10.*
./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/pcre2-10.42 \
            --enable-unicode                    \
            --enable-jit                        \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2grep-libbz2           \
            --enable-pcre2test-libreadline      \
            --disable-static                    &&
make
sudo make install
```

## swig

```shell
GitHubProxy=https://ghproxy.com/
wget ${GitHubProxy}https://github.com/swig/swig/archive/refs/tags/v4.1.1.tar.gz \
-O swig-4.1.1.tar.gz

tar zxvf swig-4.*
cd swig-4.*
./configure --prefix=/usr                      \
            --without-javascript               \
            --without-maximum-compile-warnings &&
make

sudo make install &&
sudo install -v -m755 -d /usr/share/doc/swig-4.1.1 &&
sudo cp -v -R Doc/* /usr/share/doc/swig-4.1.1
```

## oneAPI

```shell
tee > /tmp/oneAPI.repo << EOF
[oneAPI]
name=Intel® oneAPI repository
baseurl=https://yum.repos.intel.com/oneapi
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
EOF

sudo mv /tmp/oneAPI.repo /etc/yum.repos.d
sudo yum update
sudo yum install intel-basekit
```

## Faiss

```shell

GitHubProxy=https://ghproxy.com/
wget ${GitHubProxy}https://github.com/facebookresearch/faiss/archive/refs/tags/v1.7.3.tar.gz \
-O faiss-1.7.3.tar.gz

tar zxvf faiss-1.*
cd faiss-1.*

# faiss/tests/CMakeLists.txt
mkdir -p "build/_deps/googletest-subbuild/googletest-populate-prefix/src"
wget ${GitHubProxy}https://github.com/google/googletest/archive/release-1.12.1.tar.gz \
     -P "build/_deps/googletest-subbuild/googletest-populate-prefix/src" 
   
#source /opt/intel/oneapi/setvars.sh intel64  
#/opt/intel/oneapi/mkl/2023.0.0
export MKL_PATH=/opt/intel/oneapi/mkl/2023.0.0/lib/intel64
export MKL_LIBRARIES="-Wl,--start-group"
export MKL_LIBRARIES="${MKL_LIBRARIES};${MKL_PATH}/libmkl_intel_lp64.a"
export MKL_LIBRARIES="${MKL_LIBRARIES};${MKL_PATH}/libmkl_gnu_thread.a"
export MKL_LIBRARIES="${MKL_LIBRARIES};${MKL_PATH}/libmkl_core.a"
export MKL_LIBRARIES="${MKL_LIBRARIES};-Wl,--end-group"

cmake -DCMAKE_INSTALL_PREFIX= \
      -DFAISS_ENABLE_GPU=OFF \
      -DFAISS_ENABLE_PYTHON=OFF \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DCMAKE_BUILD_TYPE=Release -DFAISS_OPT_LEVEL=avx2 \
      -DBLA_VENDOR=Intel10_64lp -DMKL_LIBRARIES=${MKL_LIBRARIES} \
      -DFAISS_ENABLE_C_API=ON \
      -B build .
      
make -C build -j faiss
make -C build install
```

```shell
cp build/c_api/libfaiss_c.so ${CMAKE_INSTALL_PREFIX}/lib
```
