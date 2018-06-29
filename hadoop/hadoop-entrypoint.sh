#!/bin/bash

startMaster() {
	cd /usr/local/hadoop/sbin
	./start-all.sh
}

main() {
	service sshd restart
	sleep 5

	hdfs namenode -format

	if [ ${ROLE} == "master" ]
	then
		startMaster
	fi
}

main
