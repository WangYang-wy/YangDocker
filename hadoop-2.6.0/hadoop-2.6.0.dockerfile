FROM cluster-base:v1.0.0

# hadoop 环境安装：
RUN wget http://archive.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz \
    && tar -zxvf /hadoop-2.6.0.tar.gz -C /usr/local/ \
    && mv /usr/local/hadoop-2.6.0 /usr/local/hadoop \
    && mkdir /usr/local/hadoop/tmp/ \ 
    && mkdir /usr/local/hadoop/data/ \   
    && mkdir /usr/local/hadoop/name/ \ 
    && rm /hadoop-2.6.0.tar.gz

# java8 环境。
ENV JAVA_HOME=/usr/java/jdk1.8
ENV PATH $JAVA_HOME/bin:$PATH

# hadoop 环境。
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH
ENV HADOOP_PREFIX=$HADOOP_HOME

RUN cd $HADOOP_HOME	\
	&& echo "export JAVA_HOME=$JAVA_HOME" >> etc/hadoop/hadoop-env.sh \
	&& echo "export HADOOP_PREFIX=$HADOOP_PREFIX" >> etc/hadoop/hadoop-env.sh \
	&& echo "export JAVA_HOME=$JAVA_HOME" >> etc/hadoop/yarn-env.sh \
	&& echo "slave1" >> etc/hadoop/slaves \
	&& echo "slave2" >> etc/hadoop/slaves \
	&& echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
	&& mkdir /root/.ssh \
	&& ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa \
	&& cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys \
	&& echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config \
	&& echo "    StrictHostKeyChecking=no" >> /etc/ssh/ssh_config \
	&& chmod 600 /root/.ssh/authorized_keys 

COPY ./conf/core-site.xml $HADOOP_HOME/etc/hadoop
COPY ./conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop
COPY ./conf/mapred-site.xml $HADOOP_HOME/etc/hadoop
COPY ./conf/yarn-site.xml $HADOOP_HOME/etc/hadoop
