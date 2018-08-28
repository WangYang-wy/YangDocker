#!/bin/bash

function main() {
	service ssh restart
	service sshd restart
	if [ 'master' = ${ROLE} ]
	then
		hdfs namenode -format
	fi
}

main
