#!/bin/bash
#SBATCH -p jic-training
#SBATCH -t 2-00:00
#SBATCH -c 4
#SBATCH --mem=50000
#SBATCH -o fastqctrainingresults0212.%N.%j.out
#SBATCH -e fastqctrainingresults0212.%N.%j.err
#SBATCH --mail-user=ismael.gutierrez-fernandez\@jic.ac.uk
#SBATCH --mail-type=END,FAIL

source package /nbi/software/production/bin/fastqc-0.11.8

# path to fastq.gz files
pathDir=("/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_1424_LIB17064_LDI14177" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_1424_LIB17065_LDI14178" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_1424_LIB17066_LDI14179" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_2043_LIB24255_LDI21551" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_2043_LIB24256_LDI21552" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_2043_LIB24257_LDI21553" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_2043_LIB24258_LDI21554" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_2043_LIB24259_LDI21555" "/jic/scratch/groups/Philippa-Borrill/raw_data/example_RNA_seq/fastq/Sample_2043_LIB24260_LDI21556")

for dir in "${pathDir[@]}" # for each directory
do
# run the fastqc loop and save them in an specific folder
for f in "$dir/"*fastq.gz;
do srun fastqc *.fastq.gz -o /hpc-home/zik25cof/rna-training/fastqc_results *.fastq.gz -t 4 $f;
done
done