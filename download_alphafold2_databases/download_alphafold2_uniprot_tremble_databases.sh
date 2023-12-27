#!/bin/bash
#SBATCH --job-name="download_alphafold2_uniprot_tremble_databases_sbatch_job"
#SBATCH --time=7-00:00:00
#SBATCH --partition=cpu2019
#SBATCH --cpus-per-task=1
#SBATCH --mem=50G
#SBATCH --output=run_download_alphafold2_uniprot_tremble_databases_sbatch_job.%A.out
#SBATCH --error=run_download_alphafold2_uniprot_tremble_databases_sbatch_job.%A.err

# Get the bashrc information for conda.
source ~/.bashrc

# Activate the alphafold2 conda environment.
conda activate alphafold2_env

export PATH="/bulk/IMCshared_bulk/shared/shared_software/alphafold/aria2/bin/:$PATH"

#/bulk/IMCshared_bulk/shared/shared_software/alphafold/scripts/download_all_data.sh /bulk/IMCshared_bulk/shared/dbs/alphafold2_dbs/databases > download.log 2> download_all.log

SCRIPT_DIR="/bulk/IMCshared_bulk/shared/shared_software/alphafold/scripts"
DOWNLOAD_DIR="/bulk/IMCshared_bulk/shared/dbs/alphafold2_dbs/databases"


#echo "Downloading Uniref30..."
#bash "${SCRIPT_DIR}/download_uniref30.sh" "${DOWNLOAD_DIR}" 

#echo "Downloading Uniref90..."
#bash "${SCRIPT_DIR}/download_uniref90.sh" "${DOWNLOAD_DIR}"

echo "Downloading UniProt..."
bash "${SCRIPT_DIR}/download_uniprot.sh" "${DOWNLOAD_DIR}"

#echo "Downloading PDB SeqRes..."
#bash "${SCRIPT_DIR}/download_pdb_seqres.sh" "${DOWNLOAD_DIR}"

