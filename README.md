# nfCovid


# WORK IN PROGRES

Purpose

nfCovid is the collection of scripts in bash, py and R, and different workflows, used at the Utah Public Health Laboratory (UPHL) for SARS-CoV-2 data analysis after the Illumina dragen COVID pipeline finished the analysis phase.

##### Run automatic
      There is an screen in LWS/testing detecting the covised_complete_nf.txt file as an indicator for the illumina pipeline analysis phase completation.
      
#### Run mannualy
     nextflow run nfCovid.nf --paramito 'runname' 
     i.e. nextflow run nfCovid.nf --paramito 'UT-VH00770-231221'


## Scripts/wfs description

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


    
## parFastas.R
### R script to collect all the fastas

