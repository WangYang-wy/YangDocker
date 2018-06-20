#!/bin/bash

function main(){
	service sshd restart
    # 先启动hadoop集群。
	cd /usr/local/hadoop/sbin
	./start-all.sh

	sleep 5

	cd /usr/local/spark/sbin
	./start-all.sh
}

main
