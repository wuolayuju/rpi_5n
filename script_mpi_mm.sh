#!/bin/bash

NTASK=$1

inicio=10
 final=100
  incr=10


for i in $(seq $inicio $incr $final)
do
	sed -i "/#define N/c\#define N $i" Code/mpi_mm.c
	mpicc -o mpi_mm Code/mpi_mm.c -lm
	./script_disfile.sh mpi_mm
	mpirun -machinefile machinefile -n $NTASK ./mpi_mm  > Results/Outputs/Output_mpi_mm/mpi_mm$i.out
done
cat Results/Outputs/Output_mpi_mm/* | sort -n > Results/Outputs/Output_mpi_mm/TOTAL_MPI_MM.out
rm -f Results/Outputs/Output_mpi_mm/mpi_mm*
rm -f mpi_mm

