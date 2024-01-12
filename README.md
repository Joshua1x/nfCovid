# nfCovid


# WORK IN PROGRES

Purpose

nfCovid is the collection of scripts in bash, py and R, and different workflows, used at the Utah Public Health Laboratory (UPHL) for SARS-CoV-2 data analysis after the Illumina dragen COVID pipeline finished the analysis phase detecting the copy_complete.txt file. 

parFastas.R

fasta2json.R

ngs_summary_tracking_submission_files.R

prepare_submission_baseline_surveillance-2023.sh

cCecret.sh

RDripping_RockTriger.R

ActualizingTrackingFinishedTap.R

cCecret

Dripping_Rock

json2working_json.R

##### Run automatic
      There is an screen in LWS/testing detecting the covised_complete_nf.txt file
#### Run mannualy
     nextflow run nfCovidV4.nf --paramito 'runname' 
     i.e. nextflow run nfCovidV4.nf --paramito 'UT-VH00770-231221'

    
## parFastas.R
### R script to collect all the fastas

