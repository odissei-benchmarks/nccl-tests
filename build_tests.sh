#!/bin/bash
#
#SBATCH --job-name=make
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=30:00
#SBATCH -p rome
#SBATCH -e logs/%x-%j.err
#SBATCH -o logs/%x-%j.out

module load 2024
module load CUDA/12.6.0
module load NCCL/2.22.3-GCCcore-13.3.0-CUDA-12.6.0  
module load OpenMPI/5.0.3-NVHPC-24.9-CUDA-12.6.0

export NCCL_HOME=/sw/arch/RHEL9/EB_production/2024/software/NCCL/2.22.3-GCCcore-13.3.0-CUDA-12.6.0/
export MPI_HOME=/sw/arch/RHEL9/EB_production/2024/software/OpenMPI/5.0.3-NVHPC-24.9-CUDA-12.6.0/

# for single node
make 

# for multinode
make MPI=1 NAME_SUFFIX=_mpi
