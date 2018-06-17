FROM ubuntu:16.04

RUN wget https://github.com/apache/spark/archive/v2.2.0.tar.gz \
    && tar -zxvf /v2.2.0.tar.gz -C /usr/local/ \
    && mv /usr/local/spark-2.2.0 /usr/local/spark \
    && rm /v2.2.0.tar.gz
