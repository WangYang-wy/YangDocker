FROM ubuntu:16.04

RUN wget http://archive.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz  \
    && tar -zxvf /apache-flume-1.6.0-bin.tar.gz -C /usr/local/ \
    && mv /usr/local/apache-flume-1.6.0-bin /usr/local/flume \
    && rm /apache-flume-1.6.0-bin.tar.gz
