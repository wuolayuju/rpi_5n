#!/bin/bash

NTASK=$1

inicio=100
 final=1000
  incr=100


for i in $(seq $inicio $incr $final)
do
	sed -i "/#define N/c\#define N $i" ../Code/mpi_mm.c
	mpicc -o ../Bin/mpi_mm ../Code/mpi_mm.c -lm
	mpirun -machinefile machinefile -n $NTASK ../Bin/./mpi_mm  > ../Results/Outputs/Output_mpi_mm/mpi_mm$i.out
done
cat ../Results/Outputs/Output_mpi_mm/* | sort -n > ../Results/Outputs/Output_mpi_mm/TOTAL_MPI_MM.out
rm -f ../Results/Outputs/Output_mpi_mm/mpi_mm*
rm -f ../Bin/mpi_mm

