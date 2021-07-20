#!/bin/bash
#add fix to exercise6-fix here

server1='192.168.100.10'
server2='192.168.100.11'
length=$(($#-1))

if ["$#" -lt 2]; then 
	echo "Expected Minimum of 2 Arguments"
	exit 1
else:
	if [$HOSTNAME == $server1]
	then
		destination=server2
	else
		destination=server1
	fi

	total=0
	for i in $(($#-1))
	do
		echo "Copying $i"
		sum="rsync -av i vagrant@destination:/${@: -1} | awk 'NR==3'| awk '{print $2}'"
		total=total+sum
	done
	echo "copied total of $total bytes"
fi
