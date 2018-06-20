FROM cluster-hadoop

RUN wget https://archive.apache.org/dist/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz \
    && tar -zxvf /spark-1.6.0-bin-hadoop2.6.tgz -C /usr/local/ \
    && mv /usr/local/spark-1.6.0-bin-hadoop2.6 /usr/local/spark \
    && rm /spark-1.6.0-bin-hadoop2.6.tgz

COPY ./conf/slaves /usr/local/spark/conf/
COPY ./conf/spark-env.sh /usr/local/spark/conf/
