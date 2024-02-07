#!/bin/bash
##----------------------- Start job description -----------------------
#SBATCH --job-name=prueba
#SBATCH --nodes=1
#SBATCH --partition=standard-gpu
#SBATCH --output=/home/<code>/<user>/logs/%j.out
#SBATCH --mail-user=<your_mail>
##------------------------ End job description ------------------------

# Load modules
module purge && module load Python

# Activate virtual environment
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt # Only use the first launch

# Run script
srun python scripts/probe_magerit.py
