#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.input = "$PWD/data_test/FASTQ/"

fastqch = channel.fromFilePairs("${params.input}/*_{1,2}.fastq.gz")
vir=Channel.of('ebv') //, 'hpv', 'hcv')




process fastVifi{
  input:
    tuple val(ID), path(fastq), val(virus)
  output:
    path "${ID}_${virus}_results"
  publishDir "all_res", mode: "copy"

  """
  python ${baseDir}/FastViFi/run_kraken_vifi_docker.py --input-file ${fastq[0]} --input-file-2 ${fastq[1]} --output-dir ${ID}_${virus}_results --virus ${virus} --kraken-db-path ${baseDir}/kraken_datasets --vifi-viral-ref-dir ${baseDir}/ViFi/viral_data --vifi-human-ref-dir ${baseDir}/data_repo/hg19
  """
}

workflow{
  fastVifi(fastqch.combine(vir)).view()
}
