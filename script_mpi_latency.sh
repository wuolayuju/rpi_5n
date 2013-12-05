#!/bin/bash

NTASK=$1

mpicc -o mpi_latency Code/mpi_latency.c
./script_disfile.sh mpi_latency
mpirun -machinefile machinefile -n $NTASK mpi_latency  > Results/Outputs/Output_mpi_latency/mpi_latency.out

rm -f mpi_latency

