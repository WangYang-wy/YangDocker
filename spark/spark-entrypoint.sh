#!/bin/bash

startMaster() {
	/usr/local/hadoop/sbin/start-all.sh
	sleep 2
	/usr/local/spark/sbin/start-all.sh
}

stopMaster() {
	/usr/local/spark/sbin/stop-all.sh
	sleep 2
	/usr/local/hadoop/sbin/stop-all.sh
}

function main() {
	service ssh restart
	service sshd restart

	if [ ${ROLE} == "master" ]
	then
		# 先启动 hadoop 集群。
		hdfs namenode -format
		startMaster
	fi
}

main
