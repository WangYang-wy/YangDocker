FROM cluster-mysql

RUN wget mirror.bit.edu.cn/apache/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz \
    && tar -zxvf /apache-hive-1.2.2-bin.tar.gz -C /usr/local/ \
    && mv /usr/local/apache-hive-1.2.2-bin /usr/local/hive \
    && rm /apache-hive-1.2.2-bin.tar.gz

ENV export HIVE_HOME=/usr/local/hive
ENV PATH=$HIVE_HOME/bin:$PATH
