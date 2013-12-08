#!/bin/bash

for file in $*
do
	for i in {51..54}
	do
		scp $file root@192.168.1.$i:/root
	done
done

