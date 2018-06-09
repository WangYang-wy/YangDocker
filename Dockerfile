FROM ubuntu:16.04

# 将源更换一下，速度更快。
ADD ./utils/sources.list /etc/apt/

RUN softwares='apt-utils vim net-tools iputils-ping openssh-server openssh-client wget zsh git curl openjdk-8-jdk scala tree' \ 
    && apt-get update && apt-get install -y $softwares \
    && rm -rf /var/lib/apt/lists/* 

# 小测试。
# RUN softwares='apt-utils wget curl git vim zsh' \ 
#     && apt-get update && apt-get upgrade && apt-get install -y $softwares \
#     && rm -rf /var/lib/apt/lists/* 

# oh-my-zsh 并且更为 zsh 风格 ys，将zsh替代默认的bash。
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && cp ~/.zshrc ~/.zshrc.orig \
    && chsh -s /bin/zsh \
    && sed -ri 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/' /root/.zshrc

# hadoop 环境安装。

# spark 环境安装，重命名，删除压缩包。
RUN wget https://github.com/apache/spark/archive/v2.2.0.tar.gz \
    && tar -zxvf /v2.2.0.tar.gz -C /usr/local/ \
    && mv /usr/local/spark-2.2.0 /usr/local/spark \
    && rm /v2.2.0.tar.gz
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

# RUN mkdir /var/run/sshd

# RUN echo 'root:root' |chpasswd

# RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# EXPOSE 22

# CMD ["/usr/sbin/sshd", "-D"]
