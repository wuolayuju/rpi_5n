#!/bin/bash

NTASK=$1

inicio=100
 final=1000
  incr=100


for i in $(seq $inicio $incr $final)
do
	sed -i "/#define N/c\#define N $i" mpi_mm.c
	mpicc -o mpi_mm mpi_mm.c -lm
	mpirun -machinefile machinefile -n $NTASK ./mpi_mm  > Output_mpi_mm/mpi_mm$i.out
done
cat Output_mpi_mm/* | sort -n > Output_mpi_mm/TOTAL_MPI_MM.out
rm -f Output_mpi_mm/mpi_mm*

