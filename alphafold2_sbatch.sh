#!/bin/bash
#SBATCH --job-name="alphafold2_sbatch_job"
#SBATCH --time=24:00:00
#SBATCH --partition=bigmem,gpu-a100,gpu-v100
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=500G
#SBATCH --output=run_alphafold2_sbatch_job.%A.out
#SBATCH --error=run_alphafold2_sbatch_job.%A.err

## Slurm allocate resources using salloc command. Requesting a 5 hour wall time which is maximum.
## The gpu-a100 partition with 1 gpu, 8 cpus (maximum for alphafold2) and 500G RAM.
#salloc --time 5:00:00 --partition gpu-a100 --gres gpu:1 -n 8 --mem 500G

# Get the bashrc information for conda.
source ~/.bashrc

# Activate the alphafold2 conda environment.
conda activate alphafold2_test_env
#conda activate alphafold2_env

# The protein fasta file that contains the protein sequence for one protein to predict using alphafold.
FASTA_INFILE="/bulk/IMCshared_bulk/shared/shared_software/alphafold/example_protein.fasta"

# The output directory to write the alphafold2 output files.
OUTPUT_DIR="/bulk/IMCshared_bulk/shared/shared_software/alphafold/testing"

# The database preset for the --db_preset parameter option.
# <full_dbs|reduced_dbs>
# Choose preset MSA database configuration.
DATABASE_PRESET="full_dbs"

# The model preset for the --model_preset parameter option.
# <monomer|monomer_casp14|monomer_ptm|multimer>
# Choose preset model configuration - the monomer model, the monomer model with 
# extra ensembling, monomer model with pTM head, or multimer model
# (default: 'monomer')
MODEL_PRESET="monomer"
#MODEL_PRESET="multimer"

# The alphafold2 parameter path.
PARAMS_PATH="/bulk/IMCshared_bulk/shared/dbs/alphafold2_dbs/databases/params"

# The alphafold2 database path.
DATA_PATH="/bulk/IMCshared_bulk/shared/dbs/alphafold2_dbs/databases"

# The alphafold2 software path.
SOFTWARE_PATH="/bulk/IMCshared_bulk/shared/shared_software/alphafold"


# Make the output directory if it does not already exist.
mkdir -p ${OUTPUT_DIR}

# If multimer model preset then you can not use the --pdb70_database_path.
#if [[ "${MODEL_PRESET}" == "multimer" ]]
#then

#echo "python ${SOFTWARE_PATH}/run_alphafold.py --db_preset ${DATABASE_PRESET} --model_preset ${MODEL_PRESET} --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${DATA_PATH}/uniref30/UniRef30_2021_03 --pdb70_database_path ${DATA_PATH}/pdb70/pdb70 --pdb_seqres_database_path ${DATA_PATH}/pdb_seqres/pdb_seqres.txt --mgnify_database_path ${DATA_PATH}/mgnify/mgy_clusters_2022_05.fa --template_mmcif_dir ${DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax"

#python ${SOFTWARE_PATH}/run_alphafold.py --db_preset ${DATABASE_PRESET} --model_preset ${MODEL_PRESET} --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${DATA_PATH}/uniref30/UniRef30_2021_03 --pdb70_database_path ${DATA_PATH}/pdb70/pdb70 --pdb_seqres_database_path ${DATA_PATH}/pdb_seqres/pdb_seqres.txt --mgnify_database_path ${DATA_PATH}/mgnify/mgy_clusters_2022_05.fa --template_mmcif_dir ${DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax


#else

echo "python ${SOFTWARE_PATH}/run_alphafold.py --db_preset ${DATABASE_PRESET} --model_preset ${MODEL_PRESET} --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${DATA_PATH}/uniref30/UniRef30_2021_03 --pdb70_database_path ${DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${DATA_PATH}/mgnify/mgy_clusters_2022_05.fa --template_mmcif_dir ${DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax"

python ${SOFTWARE_PATH}/run_alphafold.py --db_preset ${DATABASE_PRESET} --model_preset ${MODEL_PRESET} --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${DATA_PATH}/uniref30/UniRef30_2021_03 --pdb70_database_path ${DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${DATA_PATH}/mgnify/mgy_clusters_2022_05.fa --template_mmcif_dir ${DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax

#fi

