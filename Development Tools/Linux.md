# Linux

+ [Beyond Linux® From Scratch (System V Edition)](https://www.linuxfromscratch.org/blfs/view/svn/index.html)

---

## [GCC, the GNU Compiler Collection](https://gcc.gnu.org/)

+ [Developer Toolset 8](https://www.softwarecollections.org/en/scls/rhscl/devtoolset-8/)
  + [CentOS 7升级gcc版本](https://www.cnblogs.com/jixiaohua/p/11732225.html)


# 镜像

+ [Ubuntu 镜像使用帮助 | 清华大学开源软件镜像站 | Tsinghua Open Source Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)

# Packages

+ [Ubuntu 22.04 LTS (Jammy Jellyfish)](https://linux-packages.com/ubuntu-jammy-jellyfish/all-packages)

# Commands

+ [9 Useful Commands to Get CPU Information on Linux](https://www.tecmint.com/check-linux-cpu-information/)
+ [How to switch between multiple GCC and G++ compiler versions on Ubuntu 22.04 LTS Jammy Jellyfish](https://linuxconfig.org/how-to-switch-between-multiple-gcc-and-g-compiler-versions-on-ubuntu-22-04-lts-jammy-jellyfish)
+ [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
  + [How to fix "dial unix /var/run/docker.sock: connect: permission denied" when group permissions seem correct?](https://stackoverflow.com/questions/51342810/how-to-fix-dial-unix-var-run-docker-sock-connect-permission-denied-when-gro)
    + `sudo setfacl --modify user:<user name or ID>:rw /var/run/docker.sock`
