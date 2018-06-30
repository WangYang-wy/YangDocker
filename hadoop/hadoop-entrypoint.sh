#!/bin/bash

startMaster() {
	/usr/local/hadoop/sbin/start-all.sh
}

main() {
	service sshd restart
	sleep 5

	if [ ${ROLE} == "master" ]
	then
		hdfs namenode -format
		startMaster
	fi
}

main
