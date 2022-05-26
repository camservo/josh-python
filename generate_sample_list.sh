#!/bin/bash


## These are all passed in
dir="./split_fastq"
ref="../ref_genome/GCA_020976825.1_BYU_Ohem_2021_genomic"
threads="3"

samples=$(ls $dir/ | cut -d'.' -f 1 | uniq | sort)

for sample in $samples; do
    run_sample.sh $sample
    # header="@RG\\tID:$sample\\tSM:$sample"
    # r1="$dir/$sample.R1.fastq.gz"
    # r2="$dir/$sample.R2.fastq.gz"
    # samfile="$sample.sam"
    # bamfile="$sample.bam"
    # viewedbamfile="$sample.viewed.bam"
    # sortedbamfile="$sample.sorted.bam"
    # indexedbamfile="aln_$sample.indexed.bam"

    # echo "bwa mem -t $thread -R "@RG\\tID:$sample\\tSM:$sample" $ref_genome $R1 $R2 > $samfile"
    # echo "cat $samfile | samtools view -b > $bamfile"
    # echo "rm $samfile"
    # echo "cat $bamfile | samtools sort > $sortedbamfile"
    # echo "rm $bamfile"
    # echo "cat $sortedbamfile | samtools index $indexedbamfile"
    # echo "rm $sortedbamfile"
done

## bwa mem -t 3 -R "@RG\\tID:DS18064\\tSM:DS18064" ../ref_genome/GCA_020976825.1_BYU_Ohem_2021_genomic split_fastq/DS18064.R1.fastq.gz split_fastq/DS18064.R2.fastq.gz |

bwa mem -t $thread -R "@RG\\tID:$sample\\tSM:$sample" $ref_genome $R1 $R2 > $bamfile




bwa mem -t $thread -R "@RG\\tID:$sample\\tSM:$sample" $ref_genome $R1 $R2 |
	samtools view -b |
	samtools sort |
	samtools index aln_$sample.paired.sorted.bam