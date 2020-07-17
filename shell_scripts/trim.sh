#!/bin/bash
for i in */R1.fastq
do
	i2=${i::-16}$"_trim.fastq"
	i2=${i2:35}
	echo $i2
	java -jar /opt/Trimmomatic-0.35/trimmomatic.jar SE $i $i2 ILLUMINACLIP:/opt/Trimmomatic-0.35/adapters/NexteraPE-PE.fa:2:30:10 SLIDINGWINDOW:5:20 MINLEN:20
done
