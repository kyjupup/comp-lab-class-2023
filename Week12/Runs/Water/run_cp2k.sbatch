#!/bin/bash
#SBATCH --job-name=cp2k_job
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --cpus-per-task=1
#SBATCH --mem=20GB
#SBATCH --time=6:00:00

# Load CP2K module
module load cp2k/openmpi/intel/20201212

INPUT_FILE="water.inp"
OUTPUT_FILE="OUTPUT_FILE_NAME.log"

# Run CP2K with MPI
mpirun -np 12 cp2k.popt -i water.inp -o OUTPUT_FILE_NAME.log
