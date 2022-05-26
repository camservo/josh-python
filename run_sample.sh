#!/bin/bash
sample=$1
echo "Running Sample: $sample"

ref_genome="../ref_genome/GCA_020976825.1_BYU_Ohem_2021_genomic"
threads="3"

header="@RG\\tID:$sample\\tSM:$sample"
r1="$dir/$sample.R1.fastq.gz"
r2="$dir/$sample.R2.fastq.gz"
samfile="$sample.sam"
bamfile="$sample.bam"
viewedbamfile="$sample.viewed.bam"
sortedbamfile="$sample.sorted.bam"
indexedbamfile="aln_$sample.indexed.bam"

echo "bwa mem -t $thread -R "@RG\\tID:$sample\\tSM:$sample" $ref_genome $r1 $r2 > $samfile"
echo "cat $samfile | samtools view -b > $bamfile"
echo "rm $samfile"
echo "cat $bamfile | samtools sort > $sortedbamfile"
echo "rm $bamfile"
echo "cat $sortedbamfile | samtools index $indexedbamfile"
echo "rm $sortedbamfile"