docker network create --subnet=172.20.0.0/16 hadoop-network
docker run -itd --name master --hostname=master --net hadoop-network --ip 172.20.0.2 cluster-hadoop zsh
docker run -itd --name slave1 --hostname=slave1 --net hadoop-network --ip 172.20.0.3 cluster-hadoop zsh
docker run -itd --name slave2 --hostname=slave2 --net hadoop-network --ip 172.20.0.4 cluster-hadoop zsh
