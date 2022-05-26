#!/bin/bash

dir="./split_fastq"
samples=$(ls $dir/ | cut -d'.' -f 1 | uniq | sort)

for sample in $samples; do
    echo "Running Task: $sample"
    ## Run one at a time
    ./run_sample.sh $sample
    ## Run all at once
    sbatch ./run_sample.sh $sample &
    echo "***********"
done