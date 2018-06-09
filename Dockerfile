FROM ubuntu:16.04

# RUN softwares='apt-utils vim net-tools iputils-ping openssh-server openssh-client wget zsh git curl openjdk-8-jdk scala tree' \ 
# && apt-get update && apt-get install -y $softwares \
# && rm -rf /var/lib/apt/lists/* 

# 小测试。
RUN softwares='apt-utils wget openssh-server openssh-client zsh git curl vim' \ 
&& apt-get update && apt-get install -y $softwares \
&& rm -rf /var/lib/apt/lists/* 

# 环境安装路径。
RUN install_path='/usr/local/'

# oh-my-zsh
# RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# zsh 风格 ys。

# hadoop 环境: 

# spark 搭建
RUN wget https://github.com/apache/spark/archive/v2.2.0.tar.gz
# tar -zxvf v2.2.0.tar.gz -C /usr/local/
# 把spark添加到环境变量：':/usr/local/spark-2.2.0/bin:/usr/local/spark-2.2.0/sbin'

# storm 环境安装
# RUN wget http://mirror.bit.edu.cn/apache/storm/apache-storm-0.9.7/apache-storm-0.9.7.tar.gz

# zookeeper 环境安装
# RUN wget http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz

# hbase 环境安装
# RUN wget http://archive.apache.org/dist/hbase/0.98.24/hbase-0.98.24-hadoop1-bin.tar.gz

# hive 环境安装
# RUN wget http://mirror.bit.edu.cn/apache/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz

# kafka 环境安装
# RUN wget http://mirror.bit.edu.cn/apache/kafka/0.10.2.1/kafka_2.11-0.10.2.1.tgz

# flume 环境安装
# RUN wget http://mirror.bit.edu.cn/apache/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz

# 修改zsh的一些配置。

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
