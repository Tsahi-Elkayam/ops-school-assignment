#!/bin/bash
#add fix to exercise6-fix here

server1='192.168.100.10'
server2='192.168.100.11'
user=vagrant
num_cp_args=$(($#-1))
cp_to=${@: -1}
array=${@:1:$num_cp_args}

if [ "$#" -lt 2 ]; then
        echo "Expected Minimum of 2 Arguments"
        exit 1
else
        if [ $HOSTNAME == $server1 ]
        then
                destination=$server2
        else
                destination=$server1
        fi

        total=0
        for i in ${array[@]};
        do
                echo "Copying," $i
                result=$(rsync -chavzP $i $user@$destination:$cp_to | awk 'NR==3'| awk '{print $2}')
                total=$(($total + $result))
        done
        echo "copied total of $total bytes"
fi
