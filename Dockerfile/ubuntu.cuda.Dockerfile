ARG CUDA_VERSION=11.8.0
ARG OS_VERSION=20.04

FROM nvidia/cuda:${CUDA_VERSION}-cudnn8-runtime-ubuntu${OS_VERSION}
# Required to build Ubuntu 20.04 without user prompts with DLFW container
ENV DEBIAN_FRONTEND=noninteractive

LABEL maintainer="GG"

ENV CUDA_INSTALL_PATH=/usr/local/cuda/
ENV CUDACXX=${CUDA_INSTALL_PATH}/bin/nvcc

SHELL ["/bin/bash", "-c"]

# Setup user account
#ARG uid=1000
#ARG gid=1000
#ARG USER_NAME=nlp
#RUN groupadd -r -f -g ${gid} ${USER_NAME} && \
#    useradd -o -r -l -u ${uid} -g ${gid} -ms /bin/bash ${USER_NAME} && \
#    usermod -aG sudo ${USER_NAME} && \
#    echo "${USER_NAME}:nvidia" | chpasswd && \
#    mkdir -p /workspace && chown ${USER_NAME} /workspace;

# Update CUDA signing key
RUN APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub

# Install requried libraries
RUN apt-get update &&  \
    apt-get install -y apt-utils software-properties-common && \
    # add-apt-repository ppa:deadsnakes/ppa && \
    # add-apt-repository ppa:ubuntu-toolchain-r/test && \
    # apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
                    tzdata \
                    git build-essential libssl-dev wget curl \
                    python3.9 python3.9-distutils python3.9-venv python3.9-dev python3-pip \
                    nano && \
    # Clear Apt Cache
    apt-get remove --purge --auto-remove -y && \
    rm -rf /var/cache/apt/archives/* && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log;

# TODO: Change from default to alternative Python 3.9
ARG PIP_OPTIONS="-i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir --upgrade"
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.9 2 && \
    update-alternatives --set python /usr/bin/python3.9 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2 && \
    update-alternatives --set python3 /usr/bin/python3.9 && \
    # python3.9 -m ensurepip --default-pip --upgrade
    python -m pip install --upgrade pip ${PIP_OPTIONS}

# TODO: Install PyPI packages
ENV PIP_ROOT_USER_ACTION=ignore
#ARG PIP_OPTIONS="-i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir --upgrade"
ARG PIP_OPTIONS="-i https://mirror.baidu.com/pypi/simple --no-cache-dir --upgrade"
RUN pip3 install pip>=23.0 setuptools>=41.0.0 ${PIP_OPTIONS} && \
    pip3 install torch --extra-index-url https://download.pytorch.org/whl/cu117 ${PIP_OPTIONS} && \
    pip3 install transformers optimum tokenizers sentencepiece ${PIP_OPTIONS} && \
    pip3 install onnx onnxruntime-gpu ${PIP_OPTIONS} && \
    pip3 install fastapi "uvicorn[standard]" ${PIP_OPTIONS}


## Set environment and working directory
# TODO: Set timezone in docker image
ARG OS_TIMEZONE=Asia/Shanghai
RUN echo ${OS_TIMEZONE} > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
WORKDIR /workspace

#USER ${USER_NAME}
RUN ["/bin/bash"]
