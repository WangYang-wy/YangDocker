FROM ubuntu:16.04

RUN wget http://download.redis.io/releases/redis-2.8.3.tar.gz \
    && tar -zxvf /redis-2.8.3.tar.gz -C /usr/local/ \
    && mv /usr/local/redis-2.8.3 /usr/local/redis \
    && rm /redis-2.8.3.tar.gz
