#!/bin/bash

inicio=10
 final=100
  incr=10

for i in $(seq $inicio $incr $final)
do
	sed -i "/#define N/c\#define N $i" Code/ser_mm.c
	gcc -o ser_mm Code/ser_mm.c -lm
	./ser_mm > Results/Outputs/Output_ser_mm/ser_mm$i.out
done
cat Results/Outputs/Output_ser_mm/* | sort -n > Results/Outputs/Output_ser_mm/TOTAL_SERIE_MM.out
rm -f Results/Outputs/Output_ser_mm/ser_mm*
rm -f ser_mm
