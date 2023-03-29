## [redis](https://hub.docker.com/_/redis/tags)


```shell
docker pull redis:latest
```

```shell
docker pull redis:7.0.10
```

```shell
docker run -d --rm --name tmp-redis-server -p 6379:6379 redis:latest
```

## [PyTorch](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch)

```shell
export FastAPIGPUDeviceID=1
export FastAPIBindPort=38080
export FastAPIRuntimeHome=${FastAPIRuntimeHome:-.}
export PretrainedModels=${PretrainedModels:-.}
export DockerImageTag=nvcr.io/nvidia/pytorch:23.02-py3

DockerRunningOptions=""
DockerRunningOptions="${DockerRunningOptions} --runtime=nvidia"

# TODO: Environment Variables
DockerRunningOptions="${DockerRunningOptions} -e NVIDIA_VISIBLE_DEVICES=${FastAPIGPUDeviceID}"
DockerRunningOptions="${DockerRunningOptions} -e TZ=Asia/Shanghai"
DockerRunningOptions="${DockerRunningOptions} -e PYTHONPATH=/workspace:/opt/conda/lib/python3.10/site-packages"

# TODO: Bind container ports to the host
DockerRunningOptions="${DockerRunningOptions} -p ${FastAPIBindPort}:38080"

# TODO: Start a container with bind mounts
DockerRunningOptions="${DockerRunningOptions} -v ${FastAPIRuntimeHome}:/workspace"
DockerRunningOptions="${DockerRunningOptions} -v ${PretrainedModels}:/PretrainedModels/HuggingFace:ro"

DockerRunningOptions="${DockerRunningOptions} --rm"
DockerRunningOptions="${DockerRunningOptions} -it"
/bin/bash -c "docker run ${DockerRunningOptions} ${DockerImageTag} /bin/bash"
```
