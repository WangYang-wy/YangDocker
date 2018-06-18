FROM ubuntu:16.04

# zookeeper 环境安装：
RUN wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz \
    && tar -zxvf /zookeeper-3.4.10.tar.gz -C /usr/local/ \
    && mv /usr/local/zookeeper-3.4.10 /usr/local/zookeeper \
    && rm /zookeeper-3.4.10.tar.gz \
    && mkdir /usr/local/zookeeper/data \
    && mkdir /usr/local/zookeeper/log

COPY ./conf/zoo.cfg /usr/local/zookeeper/conf

ENV ZOOKEEPER_HOME=/usr/local/zookeeper
ENV PATH $ZOOKEEPER_HOME/bin:$PATH
