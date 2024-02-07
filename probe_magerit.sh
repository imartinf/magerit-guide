#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --job-name=prueba
#SBATCH --nodes=1
#SBATCH --nodelist=r2n4
#SBATCH --mem-per-cpu=2G
#SBATCH --partition=standard-gpu
#SBATCH --gres=gpu:1
#SBATCH --chdir=/home/v530/v530776/multimemo
#SBATCH --output=/home/v530/v530776/multimemo/logs/%j.out
#SBATCH --mail-user=ivan.martinf@upm.es
##------------------------ End job description ------------------------

# Load modules
module purge && module load Python

# Run script
srun python scripts/probe_magerit.py