FROM ubuntu:16.04

# 将源更换一下，速度更快。
ADD ./utils/sources.list /etc/apt/

RUN apt-get update && apt-get upgrade

RUN softwares='apt-utils wget curl openjdk-8-jdk scala' \ 
    && apt-get install -y $softwares \
    && rm -rf /var/lib/apt/lists/* 

# hadoop 环境安装：
RUN wget http://archive.apache.org/dist/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz \
    && tar -zxvf /hadoop-2.8.0.tar.gz -C /usr/local/ \
    && mv /usr/local/hadoop-2.8.0 /usr/local/hadoop \
    && mkdir /usr/local/hadoop/tmp/ \ 
    && mkdir /usr/local/hadoop/data/ \ 
    && mkdir /usr/local/hadoop/name/ \ 
    && rm /hadoop-2.8.0.tar.gz

# 添加配置文件：
ADD ./hadoop/core-site.xml /usr/local/hadoop/etc/hadoop
ADD ./hadoop/hdfs-site.xml /usr/local/hadoop/etc/hadoop
ADD ./hadoop/mapred-site.xml /usr/local/hadoop/etc/hadoop
ADD ./hadoop/hadoop-env.sh /usr/local/hadoop/etc/hadoop
ADD ./hadoop/masters /usr/local/hadoop/etc/hadoop
ADD ./hadoop/slaves /usr/local/hadoop/etc/hadoop

# spark 环境安装：
RUN wget https://github.com/apache/spark/archive/v2.2.0.tar.gz \
    && tar -zxvf /v2.2.0.tar.gz -C /usr/local/ \
    && mv /usr/local/spark-2.2.0 /usr/local/spark \
    && rm /v2.2.0.tar.gz
# 把spark添加到环境变量：':/usr/local/spark-2.2.0/bin:/usr/local/spark-2.2.0/sbin'

# storm 环境安装：
RUN wget http://archive.apache.org/dist/storm/apache-storm-1.2.0/apache-storm-1.2.0-src.tar.gz \
    && tar -zxvf /apache-storm-1.2.0-src.tar.gz -C /usr/local/ \
    && mv /usr/local/apache-storm-1.2.0 /usr/local/storm \
    && rm /apache-storm-1.2.0-src.tar.gz

# zookeeper 环境安装：
RUN wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz \
    && tar -zxvf /zookeeper-3.4.10.tar.gz -C /usr/local/ \
    && mv /usr/local/zookeeper-3.4.10 /usr/local/zookeeper \
    && rm /zookeeper-3.4.10.tar.gz

# hbase 环境安装：
RUN wget http://archive.apache.org/dist/hbase/1.4.0/hbase-1.4.0-src.tar.gz \
    && tar -zxvf /hbase-1.4.0-src.tar.gz -C /usr/local/ \
    && mv /usr/local/hbase-1.4.0 /usr/local/hbase \
    && rm /hbase-1.4.0-src.tar.gz

# hive 环境安装：
RUN wget http://archive.apache.org/dist/hive/hive-2.3.0/apache-hive-2.3.0-src.tar.gz \
    && tar -zxvf /apache-hive-2.3.0-src.tar.gz -C /usr/local/ \
    && mv /usr/local/apache-hive-2.3.0-src /usr/local/hive \
    && rm /apache-hive-2.3.0-src.tar.gz

# kafka 环境安装：
RUN wget http://archive.apache.org/dist/kafka/0.11.0.2/kafka_2.11-0.11.0.2.tgz \
    && tar -zxvf /kafka_2.11-0.11.0.2.tgz -C /usr/local/ \
    && mv /usr/local/kafka_2.11-0.11.0.2 /usr/local/kafka \
    && rm /kafka_2.11-0.11.0.2.tgz

# flume 环境安装：
RUN wget http://archive.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-src.tar.gz \
    && tar -zxvf /apache-flume-1.6.0-src.tar.gz -C /usr/local/ \
    && mv /usr/local/apache-flume-1.6.0-src /usr/local/flume \
    && rm /apache-flume-1.6.0-src.tar.gz
