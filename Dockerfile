FROM ubuntu:16.04

# 将源更换一下，速度更快。
ADD ./utils/sources.list /etc/apt/

# RUN softwares='apt-utils vim net-tools iputils-ping openssh-server openssh-client wget zsh git curl openjdk-8-jdk scala tree' \ 
#     && apt-get update && apt-get install -y $softwares \
#     && rm -rf /var/lib/apt/lists/* 

# 快速测试。
RUN softwares='apt-utils wget curl' \ 
    && apt-get update && apt-get upgrade && apt-get install -y $softwares \
    && rm -rf /var/lib/apt/lists/* 

# oh-my-zsh 并且更为 zsh 风格 ys，将zsh替代默认的bash。
# RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
#     && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
#     && cp ~/.zshrc ~/.zshrc.orig \
#     && chsh -s /bin/zsh \
#     && sed -ri 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/' /root/.zshrc

# hadoop 环境安装.
RUN wget http://archive.apache.org/dist/hadoop/common/hadoop-2.8.0/hadoop-2.8.0-src.tar.gz \
    && tar -zxvf /hadoop-2.8.0-src.tar.gz -C /usr/local/ \
    && mv /usr/local/hadoop-2.8.0-src /usr/local/hadoop \
    && rm /hadoop-2.8.0-src.tar.gz

# spark 环境安装，重命名，删除压缩包：
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

# RUN mkdir /var/run/sshd

# RUN echo 'root:root' |chpasswd

# RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# EXPOSE 22

# CMD ["/usr/sbin/sshd", "-D"]
