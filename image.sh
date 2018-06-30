#!/bin/bash

docker build -t cluster-base    ./base
docker build -t cluster-hadoop  ./hadoop
docker build -t cluster-spark   ./spark
# docker build -t cluster-hbase   ./hbase
# docker build -t cluster-hive    ./hive
# docker build -t cluster-flume   ./flume
# docker build -t cluster-storm   ./storm
# docker build -t cluster-zk      ./zookeeper
# docker build -t cluster-kafka   ./kafka
# docker build -t cluster-mysql   ./mysql
# docker build -t cluster-redis   ./redis
