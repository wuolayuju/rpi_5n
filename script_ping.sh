#!/bin/bash


for i in {51..54}
do
	ping -c 1 192.168.1.$i
	echo 
done


