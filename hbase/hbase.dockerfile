FROM y

RUN wget http://archive.apache.org/dist/hbase/hbase-0.98.6/hbase-0.98.6-hadoop2-bin.tar.gz \
    && tar -zxvf /hbase-0.98.6-hadoop2-bin.tar.gz -C /usr/local/ \
    && mv /usr/local/hbase-0.98.6-hadoop2 /usr/local/hbase \
    && rm /hbase-0.98.6-hadoop2-bin.tar.gz