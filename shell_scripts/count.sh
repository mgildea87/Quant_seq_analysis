#!/bin/bash
A_filepath="/home/mag456/Quantseq2.2017/star_alignment_files/"
D_file_path="/home/mag456/Quantseq2.2017/aligned_counted/"
gff="/home/mag456/Quantseq2.2017/Genome/PROcapTSS_TIFseq_anno.txt"
for i in $A_filepath*.bam
do
	i2=${i::-34}
	i2=${i2:49}"_counted.txt"
	echo $i2
	echo $D_file_path$i2
	python -m HTSeq.scripts.count -f bam -t mRNA -m intersection-nonempty $i $gff > $D_file_path$i2
done
