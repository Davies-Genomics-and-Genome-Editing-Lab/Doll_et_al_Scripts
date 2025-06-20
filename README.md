# Doll_et_al_Scripts

## GUIDE-Seq analysis
1. GUIDE-Seq pipeline was run on unidentified R1, R2, I1 and I2 fastq reads (deposited on GEO) using manifest.yaml settings, as previously described
(https://www.nature.com/articles/s41596-021-00626-x).\

## TARGET-Seq scRNA analysis
1. Samples were demultiplexed by plate within the bcl2fastq workflow, resulting in R1 and R2 fastq files for each plate (deposited on GEO)
2. Files were then further preprocessed using the commands in RNASeq_preprocessing.sh
    - Demultiplexing by cell and adapter trimming using cutadapt. Barcodes provided in scRNAseq_barcodes.fasta
    - Alignment and feature counting using STARSolo


## TARGET-Seq Genotyping analysis
1. Samples were demultiplexed by well within the bcl2fastq workflow, resulting in R1 and R2 fastq files for each well (deposited on GEO)
2. Files were then further demultiplexed by well using the in-line barcodes introduced in PCR2 primers, using the Genotyping_demultiplexing.ipynb script
    - R1 and R2 barcodes provided in .tsv files
3. CRISPResso2 was then run on each individual cell using Genotyping_seqkit_and_crispresso.ipynb
4. Properties of individual cells were then called using Genotyping_call_cells_from_crispresso.ipynb


## TARGET-Seq Data integration
1. Feature counts, genotypes and well metadata (TARGET_Seq_well_metadata.xlsx) were integrated and analysed in R
