#/bin/bash
for i in *trim.fastq
do
	echo $i
	fastqc $i
done
