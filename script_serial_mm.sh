#!/bin/bash

limits=(25 50 100 150 200 250 300 350 400 450 500 550)
gcc -o ser_mm Code/ser_mm.c -lm
for i in "${limits[@]}"
do

	./ser_mm $i > Results/Outputs/Output_ser_mm/ser_mm$i.out
done
cat Results/Outputs/Output_ser_mm/* | sort -n > Results/Outputs/Output_ser_mm/TOTAL_SERIE_MM.out
rm -f Results/Outputs/Output_ser_mm/ser_mm*
rm -f ser_mm
