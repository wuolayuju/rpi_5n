#!/bin/bash

NTASK=$1

mpicc -o ../Bin/mpi_bandwidth ../Code/bandwidth_mpi.c
mpirun -machinefile machinefile -n $NTASK ./mpi_bandwidth  > ../Results/Outputs/Output_mpi_bandwidth/mpi_bandwidth$i.out

rm -f ../Bin/mpi_bandwidth

