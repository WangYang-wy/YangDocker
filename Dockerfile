FROM ubuntu:16.04

RUN softwares='apt-utils vim net-tools iputils-ping openssh-server openssh-client zsh wget git curl openjdk-8-jdk scala tree' \ 
&& apt-get update && apt-get install -y $softwares \
&& rm -rf /var/lib/apt/lists/* 

# oh-my-zsh
# RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# zsh 风格 ys。

# hadoop 环境: 

# spark 搭建
# RUN wget https://github.com/apache/spark/archive/v2.2.0.tar.gz
# tar -zxvf v2.2.0.tar.gz -C /usr/local/
# 把spark添加到环境变量：':/usr/local/spark-2.2.0/bin:/usr/local/spark-2.2.0/sbin'

# 修改zsh的一些配置。

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
