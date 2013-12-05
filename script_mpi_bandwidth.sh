#!/bin/bash

NTASK=$1

mpicc -o mpi_bandwidth Code/bandwidth_mpi.c
./script_disfile.sh mpi_bandwidth
mpirun -machinefile machinefile -n $NTASK mpi_bandwidth  > Results/Outputs/Output_mpi_bandwidth/mpi_bandwidth.out

rm -f mpi_bandwidth

