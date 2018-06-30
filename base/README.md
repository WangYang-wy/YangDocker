# base

## apt 源

[sources.list](./sources.list)：使用阿里源，加快下载速度。

安装java scala python3。

配置各个节点之间的免密登陆。

zsh 命令行 ys 主题。

## 启动集群

```bash
docker network create --subnet=172.20.0.0/16 base-network
docker run -itd --name base-master --hostname=base-master --net base-network --ip 172.20.0.2 cluster-base zsh
docker run -itd --name base-slave1 --hostname=base-slave1 --net base-network --ip 172.20.0.3 cluster-base zsh
docker run -itd --name base-slave2 --hostname=base-slave2 --net base-network --ip 172.20.0.4 cluster-base zsh
```
