# YangDocker

自助搭建的 Docker。

ubuntu:16.04

docker pull ubuntu:16.04

docker run -ti --name master ubuntu:16.04 bash

docker run -ti --name slave1 --link source:master ubuntu:16.04 bash

docker run -ti --name slave2 --link source:master ubuntu:16.04 bash

docker run -ti --name master --hostname=Master ubuntu:16.04 bash

openjdk-8-jdk