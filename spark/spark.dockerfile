FROM cluster-hadoop

RUN wget https://archive.apache.org/dist/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz \
    && tar -zxvf /spark-1.6.0-bin-hadoop2.6.tgz -C /usr/local/ \
    && mv /usr/local/spark-1.6.0-bin-hadoop2.6 /usr/local/spark \
    && rm /spark-1.6.0-bin-hadoop2.6.tgz

RUN cd /usr/local/spark	\
	&& echo "slave1" >> conf/slaves	\
	&& echo "slave2" >> conf/slaves	\
	&& echo "export SCALA_HOME=/usr/local/scala" >> conf/spark-env.sh	\
	&& echo "export JAVA_HOME=$JAVA_HOME" >> conf/spark-env.sh	\
	&& echo "export HADOOP_HOME=$HADOOP_HOME" >> conf/spark-env.sh	\
	&& echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> conf/spark-env.sh	\
	&& echo "SPARK_MASTER_IP=master" >> conf/spark-env.sh	\
	&& echo "SPARK_LOCAL_DIRS=/usr/local/spark" >> conf/spark-env.sh	\
	&& echo "SPARK_DRIVER_MEMORY=1G" >> conf/spark-env.sh
	