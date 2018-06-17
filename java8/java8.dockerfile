FROM ubuntu:16.04

# Java install
RUN apt-get update && apt-get upgrade

RUN softwares='openjdk-8-jdk' \ 
    && apt-get install -y $softwares \
    && rm -rf /var/lib/apt/lists/* 

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH
