#!/bin/bash

NTASK=$1

limits=(25 50 100 150 200 250 300 350 400 450 500 550)
mpicc -o mpi_mm Code/mpi_mm.c -lm
./script_disfile.sh mpi_mm
for i in "${limits[@]}"
do
	#sed -i "/#define N/c\#define N $i" Code/mpi_mm.c
	mpirun -machinefile machinefile -n $NTASK ./mpi_mm $i $i $i  > Results/Outputs/Output_mpi_mm/mpi_mm$i.out
done
cat Results/Outputs/Output_mpi_mm/* | sort -n > Results/Outputs/Output_mpi_mm/TOTAL_MPI_MM.out
rm -f Results/Outputs/Output_mpi_mm/mpi_mm*
rm -f mpi_mm

