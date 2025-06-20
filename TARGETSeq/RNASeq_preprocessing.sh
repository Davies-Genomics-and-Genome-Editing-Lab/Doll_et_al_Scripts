#Trim for Nextera adapter
cutadapt --cores=0 --pair-filter=any -e 1 --action=trim -g ^file:${analysis_dir}/scRNASeq_barcodes.fasta -o ${analysis_dir}/trimmed/r1-dump/${sample_plate}-trimmed-{name}.1.fastq.gz -p ${analysis_dir}/trimmed/${sample_plate}-trimmed-{name}.2.fastq.gz -a CTGTCTCTTATACACATCT -a "A{10}" --overlap 3 ${fastq_dir}/ex43-${sample_plate}_R1_001.fastq.gz ${fastq_dir}/ex43-${sample_plate}_R2_001.fastq.gz
#Retrim for PolyA
cutadapt -a "A{10}" --minimum-length 1 -o ${analysis_dir}/retrimmed/${outPrefix}.fastq ${file}

#STARSolo
STAR \
  --genomeDir ${genomeDir} \
  --runThreadN 8 \
  --soloType SmartSeq \
  --readFilesManifest retrimmed/manifest.tsv \
  --soloUMIdedup NoDedup \
  --soloStrand Unstranded \
  --soloMultiMappers Unique \
  --soloFeatures Gene \
  --outFileNamePrefix $analysis_dir/starsolo_v2/
