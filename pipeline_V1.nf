#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.var_path='/media/mdufeu/My_Passport/1__________Projet_genomique_medicale/Projet4'
// params.virus="hpv"


ch = Channel.of(params.var_path)

process fastVifi{
  input:
  path var_path
  output:
  stdout

  """
  //echo $var_path
  python ../../../run_kraken_vifi_docker.py --input-file /media/mdufeu/My_Passport/1__________Projet_genomique_medicale/Projet4/data_test/FASTQ/NA06984_T_1.fastq.gz --input-file-2 /media/mdufeu/My_Passport/1__________Projet_genomique_medicale/Projet4/data_test/FASTQ/NA06984_T_2.fastq.gz --output-dir rst_test --virus hpv --kraken-db-path /media/mdufeu/My_Passport/1__________Projet_genomique_medicale/Projet4/kraken_datasets --vifi-viral-ref-dir /media/mdufeu/My_Passport/1__________Projet_genomique_medicale/Projet4/ViFi/viral_data --vifi-human-ref-dir /media/mdufeu/My_Passport/1__________Projet_genomique_medicale/Projet4/hg19
  """
}

workflow{
  fastVifi(ch).view{it}
}
