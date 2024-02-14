#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --job-name=prueba
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=12G
#SBATCH --partition=standard-gpu
#SBATCH --gres=gpu:1
#SBATCH --output=/home/<code>/<user>/magerit-guide/%j.out
#SBATCH --mail-user=<your_mail>
##------------------------ End job description ------------------------

# Load modules
module purge && module load Python/3.10.8-GCCcore-12.2.0

# Activate virtual environment
source venv/bin/activate

# Install dependencies
# pip install -r requirements.txt # Only use the first launch

# Run script
srun python probe_magerit.py