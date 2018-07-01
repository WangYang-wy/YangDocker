FROM cluster-spark

RUN wget http://archive.apache.org/dist/hbase/hbase-0.98.6/hbase-0.98.6-hadoop2-bin.tar.gz \
    && tar -zxvf /hbase-0.98.6-hadoop2-bin.tar.gz -C /usr/local/ \
    && mv /usr/local/hbase-0.98.6-hadoop2 /usr/local/hbase \
    && rm /hbase-0.98.6-hadoop2-bin.tar.gz \
    && mkdir /usr/local/hbase/tmp

ENV JAVA_HOME=/usr/local/jdk1.8
ENV CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib

ENV HBASE_HOME=/usr/local/hbase
ENV HBASE_CLASSPATH=$HBASE_HOME/conf
ENV HBASE_LOG_DIR=$HBASE_HOME/logs
ENV PATH=$PATH:$HBASE_HOME/bin
