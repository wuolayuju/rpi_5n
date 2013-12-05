#!/bin/bash

NTASK=$1

inicio=100000
 final=1000000
  incr=100000


for i in $(seq $inicio $incr $final)
do
	sed -i "/#define LIMIT/c\#define LIMIT $i" ../Code/mpi_prime.c
	mpicc -o ../Bin/mpi_prime ../Code/mpi_prime.c -lm
	mpirun -machinefile machinefile -n $NTASK ../Bin/./mpi_prime  > ../Results/Outputs/Output_mpi_prime/mpi_prime$i.out
done
cat ../Results/Outputs/Output_mpi_prime/* | sort -n > ../Results/Outputs/Output_mpi_prime/TOTAL_MPI_PRIME.out
rm -f ../Results/Outputs/Output_mpi_prime/mpi_prime*
rm -f ../Bin/mpi_prime

