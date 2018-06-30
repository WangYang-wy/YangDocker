# hadoop

## 网络

- master: 172.17.0.2
- slave1: 172.17.0.3
- slave2: 172.17.0.4

## cluster-hadoop

hadoop 单机的集群，以 cluster-base 为基础。

## 启动镜像

```bash
docker network create --subnet=172.18.0.0/16 hadoop-network
docker run -itd --name hadoop-master --hostname=hadoop-master --net hadoop-network --ip 172.18.0.2 cluster-hadoop zsh
docker run -itd --name hadoop-slave1 --hostname=hadoop-slave1 --net hadoop-network --ip 172.18.0.2 cluster-hadoop zsh
docker run -itd --name hadoop-slave2 --hostname=hadoop-slave2 --net hadoop-network --ip 172.18.0.2 cluster-hadoop zsh
```

docker run -ti --name master --hostname=master ubuntu:16.04 zsh
docker run -ti --name slave1 --hostname=slave1 ubuntu:16.04 zsh
docker run -ti --name slave2 --hostname=slave2 ubuntu:16.04 zsh