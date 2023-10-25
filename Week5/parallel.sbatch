#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --time=20:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=Parallel_tempering 
#SBATCH --output=Parallel_tempering.out

module load gromacs/openmpi/intel/2018.3

gmx_mpi grompp -f adp_T300.mdp -c adp.gro -p adp.top -o T300.tpr -maxwarn 1
gmx_mpi grompp -f adp_T363.mdp -c adp.gro -p adp.top -o T363.tpr -maxwarn 1
gmx_mpi grompp -f adp_T400.mdp -c adp.gro -p adp.top -o T400.tpr -maxwarn 1

mpirun -np 3 gmx_mpi mdrun -s adp -multidir T300/ T363/ T400/ -deffnm adp_exchange3temps -replex 50







