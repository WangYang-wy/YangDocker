FROM ubuntu:16.04

# COPY hadoop-entrypoint.sh /usr/bin/
# RUN chmod a+x /usr/bin/hadoop-entrypoint.sh

# ENTRYPOINT [ "sh", "-c", "./usr/bin/hadoop-entrypoint.sh; bash"]

# hadoop 环境安装：
RUN wget http://archive.apache.org/dist/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz \
    && tar -zxvf /hadoop-2.8.0.tar.gz -C /usr/local/ \
    && mv /usr/local/hadoop-2.8.0 /usr/local/hadoop \
    && mkdir /usr/local/hadoop/tmp/ \ 
    && mkdir /usr/local/hadoop/data/ \   
    && mkdir /usr/local/hadoop/name/ \ 
    && rm /hadoop-2.8.0.tar.gz

#这个文件默认不存在，需要从 mapred-site.xml.template 复制过来
RUN cp mapred-site.xml.template mapred-site.xml

# 添加配置文件：
ADD ./hadoop/core-site.xml /usr/local/hadoop/etc/hadoop
ADD ./hadoop/hdfs-site.xml /usr/local/hadoop/etc/hadoop
ADD ./hadoop/mapred-site.xml /usr/local/hadoop/etc/hadoop
ADD ./hadoop/hadoop-env.sh /usr/local/hadoop/etc/hadoop
ADD ./hadoop/masters /usr/local/hadoop/etc/hadoop
ADD ./hadoop/slaves /usr/local/hadoop/etc/hadoop
