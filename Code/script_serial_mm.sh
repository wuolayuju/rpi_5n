#!/bin/bash

inicio=100
 final=1000
  incr=100

for i in $(seq $inicio $incr $final)
do
	sed -i "/#define N/c\#define N $i" ser_mm.c
	gcc -o ser_mm ser_mm.c -lm
	./ser_mm > Output_ser_mm/ser_mm$i.out
done
cat Output_ser_mm/* | sort -n > Output_ser_mm/TOTAL_SERIE_MM.out
rm -f Output_ser_mm/ser_mm*

