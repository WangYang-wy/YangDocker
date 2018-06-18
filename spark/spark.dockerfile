FROM ubuntu:16.04

RUN wget https://github.com/apache/spark/archive/v2.2.0.tar.gz \
    && tar -zxvf /v2.2.0.tar.gz -C /usr/local/ \
    && mv /usr/local/spark-2.2.0 /usr/local/spark \
    && rm /v2.2.0.tar.gz

RUN cd /usr/local/spark	\
	&& echo "slave1" >> conf/slaves	\
	&& echo "slave2" >> conf/slaves	\
	&& echo "export SCALA_HOME=/usr/local/scala-2.12.4" >> conf/spark-env.sh	\
	&& echo "export JAVA_HOME=$JAVA_HOME" >> conf/spark-env.sh	\
	&& echo "export HADOOP_HOME=$HADOOP_HOME" >> conf/spark-env.sh	\
	&& echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> conf/spark-env.sh	\
	&& echo "SPARK_MASTER_IP=master" >> conf/spark-env.sh	\
	&& echo "SPARK_LOCAL_DIRS=/usr/local/spark" >> conf/spark-env.sh	\
	&& echo "SPARK_DRIVER_MEMORY=1G" >> conf/spark-env.sh