# base

## apt 源

[sources.list](./sources.list)：使用阿里源，加快下载速度。

安装java scala python3。

配置各个节点之间的免密登陆。

zsh 命令行 ys 主题。

## 启动集群

```bash
docker network create --subnet=172.20.0.0/16 cluster-network
docker run -itd --name master --hostname=master --net cluster-network --ip 172.20.0.2 ubuntu:16.04 bash
docker run -itd --name slave1 --hostname=slave1 --net cluster-network --ip 172.20.0.3 ubuntu:16.04 bash
docker run -itd --name slave2 --hostname=slave2 --net cluster-network --ip 172.20.0.4 ubuntu:16.04 bash
```
