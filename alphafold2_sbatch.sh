#!/bin/bash
#SBATCH --job-name="alphafold2_sbatch_fix_job"
#SBATCH --time=24:00:00
#SBATCH --partition=bigmem,gpu-a100,gpu-v100
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=500G
#SBATCH --output=run_alphafold2_sbatch_fix_job.%A.out
#SBATCH --error=run_alphafold2_sbatch_fix_job.%A.err

#salloc --time 5:00:00 --partition gpu-a100 --gres gpu:1 -n 8 --mem 500G

# Get the bashrc information for conda.
source ~/.bashrc

# Activate the alphafold2 conda environment.
conda activate alphafold2_test_env

ALPHAFOLD_PARAMS_PATH="/bulk/IMCshared_bulk/shared/dbs/alphafold2_dbs/databases/params"
ALPHAFOLD_DATA_PATH="/bulk/IMCshared_bulk/shared/dbs/alphafold2_dbs/databases"
ALPHAFOLD_SOFTWARE_PATH="/bulk/IMCshared_bulk/shared/shared_software/alphafold"
#FASTA_INFILE="/work/sycuro_lab/kevin/tkg_pilot_project_2021/isolate_genomes_and_mags/vanderveer2019_genome_assemblies/genome_assemblies/RL03_LVM_lactobacillus_crispatus_GCF_004361385_pullulanase_type_I_functional_gene.fasta"
FASTA_INFILE="/bulk/IMCshared_bulk/shared/shared_software/alphafold/example_protein.fasta"

#OUTPUT_DIR="/work/sycuro_lab/kevin/dominant_lactobacillus_genomes/alphafold2/L_crispatus_RL03_pulA"

OUTPUT_DIR="/bulk/IMCshared_bulk/shared/shared_software/alphafold/testing"

mkdir -p ${OUTPUT_DIR}

#python ${ALPHAFOLD_SOFTWARE_PATH}/run_alphafold.py --data_dir ${ALPHAFOLD_DATA_PATH} --output_dir ${OUTPUT_DIR} --fasta_paths ${FASTA_INFILE} --max_template_date=2023-08-04 --db_preset full_dbs --bfd_database_path ${ALPHAFOLD_DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${ALPHAFOLD_DATA_PATH}/uniref90/uniref90.fasta --uniclust30_database_path ${ALPHAFOLD_DATA_PATH}/uniclust30/uniclust30_2018_08/uniclust30_2018_08 --pdb70_database_path ${ALPHAFOLD_DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${ALPHAFOLD_DATA_PATH}/mgnify/mgy_clusters.fa --template_mmcif_dir ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax True --model_preset monomer --model_names 'model_1','model_2','model_3','model_4','model_5' --preset casp14

#python ${ALPHAFOLD_SOFTWARE_PATH}/run_alphafold.py --data_dir ${ALPHAFOLD_DATA_PATH} --output_dir ${OUTPUT_DIR} --fasta_paths ${FASTA_INFILE} --max_template_date=2023-08-04 --db_preset full_dbs --bfd_database_path ${ALPHAFOLD_DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${ALPHAFOLD_DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${ALPHAFOLD_DATA_PATH}/uniref30/uniref30.fasta --pdb70_database_path ${ALPHAFOLD_DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${ALPHAFOLD_DATA_PATH}/mgnify/mgy_clusters.fa --template_mmcif_dir ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax True --model_preset monomer --model_names 'model_1','model_2','model_3','model_4','model_5' --preset casp14

#python ${ALPHAFOLD_SOFTWARE_PATH}/run_alphafold.py --data_dir ${ALPHAFOLD_DATA_PATH} --output_dir ${OUTPUT_DIR} --fasta_paths ${FASTA_INFILE} --max_template_date=2023-08-04 --db_preset full_dbs --bfd_database_path ${ALPHAFOLD_DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${ALPHAFOLD_DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${ALPHAFOLD_DATA_PATH}/uniref30/uniref30.fasta --pdb70_database_path ${ALPHAFOLD_DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${ALPHAFOLD_DATA_PATH}/mgnify/mgy_clusters.fa --template_mmcif_dir ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/obsolete.dat --model_preset monomer

#echo "python ${ALPHAFOLD_SOFTWARE_PATH}/run_alphafold.py --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${ALPHAFOLD_DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${ALPHAFOLD_DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${ALPHAFOLD_DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${ALPHAFOLD_DATA_PATH}/uniref30/uniref30.fasta --pdb70_database_path ${ALPHAFOLD_DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${ALPHAFOLD_DATA_PATH}/mgnify/mgy_clusters.fa --template_mmcif_dir ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax"

#python ${ALPHAFOLD_SOFTWARE_PATH}/run_alphafold.py --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${ALPHAFOLD_DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${ALPHAFOLD_DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${ALPHAFOLD_DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${ALPHAFOLD_DATA_PATH}/uniref30/uniref30.fasta --pdb70_database_path ${ALPHAFOLD_DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${ALPHAFOLD_DATA_PATH}/mgnify/mgy_clusters.fa --template_mmcif_dir ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax

echo "python ${ALPHAFOLD_SOFTWARE_PATH}/run_alphafold.py --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${ALPHAFOLD_DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${ALPHAFOLD_DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${ALPHAFOLD_DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${ALPHAFOLD_DATA_PATH}/uniref30/UniRef30_2021_03 --pdb70_database_path ${ALPHAFOLD_DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${ALPHAFOLD_DATA_PATH}/mgnify/mgy_clusters_2022_05.fa --template_mmcif_dir ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax"

python ${ALPHAFOLD_SOFTWARE_PATH}/run_alphafold.py --fasta_paths ${FASTA_INFILE} --max_template_date 2023-08-04 --data_dir ${ALPHAFOLD_DATA_PATH} --output_dir ${OUTPUT_DIR} --bfd_database_path ${ALPHAFOLD_DATA_PATH}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniref90_database_path ${ALPHAFOLD_DATA_PATH}/uniref90/uniref90.fasta --uniref30_database_path ${ALPHAFOLD_DATA_PATH}/uniref30/UniRef30_2021_03 --pdb70_database_path ${ALPHAFOLD_DATA_PATH}/pdb70/pdb70 --mgnify_database_path ${ALPHAFOLD_DATA_PATH}/mgnify/mgy_clusters_2022_05.fa --template_mmcif_dir ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/mmcif_files --obsolete_pdbs_path ${ALPHAFOLD_DATA_PATH}/pdb_mmcif/obsolete.dat --use_gpu_relax


