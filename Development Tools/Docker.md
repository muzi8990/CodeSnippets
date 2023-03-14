# [Docker](https://www.docker.com/)

+ [Docker](https://docs.docker.com/)
+ [Docker Desktop](https://docs.docker.com/desktop/)
  + [Install Docker Desktop on Mac](https://docs.docker.com/desktop/install/mac-install/)

+ [Docker frequently asked questions](https://docs.docker.com/engine/faq/)

+ [Runtime options with Memory, CPUs, and GPUs](https://docs.docker.com/config/containers/resource_constraints/)
+ [Docker Desktop Install on Linux](https://docs.docker.com/desktop/install/linux-install/)
+ [Install Docker Engine](https://docs.docker.com/engine/install/)
  + [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
  + [Install Docker Engine on CentOS](https://docs.docker.com/engine/install/centos/)
  + [Post-installation steps for Linux](https://docs.docker.com/engine/install/linux-postinstall/)

+ [Install Docker Compose](https://docs.docker.com/compose/install/)
  + [Install on Linux](https://docs.docker.com/compose/install/linux/)

+ [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker)
  + [Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
<!--   + [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) -->

---

# Docker Compose

+ [Docker Compose](https://docs.docker.com/compose/)
  + [Install Docker Compose](https://docs.docker.com/compose/install/)
+ [Compose specification](https://docs.docker.com/compose/compose-file/)
+ [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/compose-file-v3/)
+ [Compose file deploy reference](https://docs.docker.com/compose/compose-file/deploy/)
+ [Compose file build reference](https://docs.docker.com/compose/compose-file/build/)
+ [Enabling GPU access with Compose](https://docs.docker.com/compose/gpu-support/)

# SDK

+ [Docker SDK for Python](https://docker-py.readthedocs.io/en/stable/index.html)
  + [Containers](https://docker-py.readthedocs.io/en/stable/containers.html)

+ [Docker Engine](https://docs.docker.com/engine/)
  + [Configure logging drivers](https://docs.docker.com/config/containers/logging/configure/)
    + [Local File logging driver Options](https://docs.docker.com/config/containers/logging/local/#options)
    + [JSON File logging driver Options](https://docs.docker.com/config/containers/logging/json-file/#options)

# [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-container-toolkit)

+ [NVIDIA Container Toolkit Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

# Examples

+ [Which OS is running in my Docker container?](https://serverfault.com/questions/805389/which-os-is-running-in-my-docker-container)

    `cat /etc/issue`

+ [Default timezone in Docker containers](https://support.circleci.com/hc/en-us/articles/115015771347-How-do-I-set-the-timezones-in-Docker-images-)
+ [Docker 时区调整方案](https://cloud.tencent.com/developer/article/1626811)
+ [Setting the timezone](https://wiki.alpinelinux.org/wiki/Setting_the_timezone)
+ [Set timezone in your docker image](https://dev.to/0xbf/set-timezone-in-your-docker-image-d22)
+ ["internet connection issue" while creating Docker Image](https://stackoverflow.com/questions/58603749/internet-connection-issue-while-creating-docker-image)

+ [How To Install and Use Docker Compose on Rocky Linux 8](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-rocky-linux-8)

+ [Dragonfly2](https://github.com/dragonflyoss/Dragonfly2/blob/main/deploy/docker-compose/docker-compose.yaml)
+ [x-variables](https://github.com/guessi/docker-compose-etcd/blob/master/docker-compose.yml)

```shell
docker inspect container_name | grep Cpu
docker stats container_name
docker logs container_name

docker compose ps
docker compose --compatibility up -d -f -f docker-compose.yml
docker compose down
```

# Dockerfiles

+ [NGINX](https://github.com/nginxinc/docker-nginx)

# Containers

+ [Nginx](https://hub.docker.com/_/nginx)
+ [PyTorch](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch/tags)
