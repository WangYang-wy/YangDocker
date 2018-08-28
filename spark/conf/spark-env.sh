export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/usr/local/jdk1.8
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

SPARK_MASTER_IP=master
SPARK_LOCAL_DIRS=/usr/local/spark
SPARK_DRIVER_MEMORY=1G  # 每个worker结点能够最大分配给executors的内存大小，依据自己的机器而定
export SPARK_WORKER_INSTANCES=1     # 每台机器上开启worker结点的数目
export SPARK_MASTER_PORT=7077
export SPARK_WORKER_CORES=2         # 每个worker结点所占有的CPU核数目
export SPARK_WORKER_MEMORY=512m     
