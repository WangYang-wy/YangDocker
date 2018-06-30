FROM ubuntu:16.04

RUN wget wget https://archive.apache.org/dist/storm/apache-storm-0.9.3/apache-storm-0.9.3.tar.gz \
    && tar -zxvf /apache-storm-0.9.3.tar.gz -C /usr/local \
    && mv /usr/local/apache-storm-0.9.3 /usr/local/storm \
    && rm /apache-storm-0.9.3.tar.gz
