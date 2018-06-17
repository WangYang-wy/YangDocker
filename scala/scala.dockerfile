FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade

RUN softwares='scala' && apt-get install -y $softwares && rm -rf /var/lib/apt/lists/* 

ENV SCALA_HOME=/usr/share/scala-2.11

ENV PATH $SCALA_HOME/bin:$PATH
