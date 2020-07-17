#!/bin/bash

genomefa="/home/mag456/Quantseq2.2017/star_genome/cere_gen.fa"
genomegff="/home/mag456/Quantseq2.2017/star_genome/cere_gen.gff"
genomedir="/home/mag456/Quantseq2.2017/star_genome/"
path="/home/mag456/Quantseq2.2017/"
outpath="/home/mag456/Quantseq2.2017/star_alignment_files/"
readlength=75

#STAR --runMode genomeGenerate --genomeDir $genomedir --genomeFastaFiles $genomefa --sjdbGTFfile $genomegff --sjdbOverhang $(($readlength -1)) --sjdbGTFtagExonParentTranscript Parent --sjdbGTFfeatureExon CDS

for i in $path*trim.fastq
do
	i2=${i:28}
	i3=${i2::-6}
	echo $i2
	STAR --genomeDir $genomedir --readFilesIn $path$i2 --alignIntronMin 10 --alignIntronMax 1000 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $outpath$i3 --alignEndsType EndToEnd --outSAMattributes All --runThreadN 8 --outFilterMismatchNmax 14 --outFilterMultimapNmax 2

done

