#!/bin/bash

startMaster() {
	/usr/local/hadoop/sbin/start-all.sh
}

stopMaster() {
	/usr/local/hadoop/sbin/stop-all.sh
}

main() {
	service ssh restart
	service sshd restart

	sleep 5

	if [${ROLE}=="master"]
	then
		hdfs namenode -format
		startMaster
	fi
}

main
