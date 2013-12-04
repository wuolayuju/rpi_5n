#!/bin/bash

inicio=100000
 final=1000000
  incr=100000

for i in $(seq $inicio $incr $final)
do
	sed -i "/#define LIMIT/c\#define LIMIT $i" ser_prime.c
	gcc -o ser_prime ser_prime.c -lm
	./ser_prime > Output_ser_prime/ser_prime$i.out
done
cat Output_ser_prime/* | sort -n > Output_ser_prime/TOTAL_SERIE_PRIME.out
rm -f Output_ser_prime/ser_prime*

