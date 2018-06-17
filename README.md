# YangDocker

自助搭建的 hadoop + spark + kafka + zookeeper + storm + hbase + hive + flume 集群，一主两从。

## 操作指南

先将项目 clone 到本地，然后进入目录，然后运行：

```bash
bash ./deploy.sh
```

然后等待。

## 操作系统

ubuntu:16.04

docker run -ti --name master --hostname=master ubuntu:16.04 bash

docker run -ti --name slave1 --hostname=slave1 ubuntu:16.04 bash

docker run -ti --name slave2 --hostname=slave2 ubuntu:16.04 bash

## 工具包

- openjdk-8-jdk
- zsh
- oh-my-zsh
- git
- wget
- curl
- vim
- openssh-server
- openssh-client
- tree

## 环境

- jdk1.8
- python3
- hadoop-2.8.0
- spark-2.2.0

## 参考

1. [利用Docker搭建大数据处理集群](https://blog.csdn.net/iigeoxiaoyang/article/details/53020066)
