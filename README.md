# nfCovid


# WORK IN PROGRES

Purpose

nfCovid is the collection of scripts in bash, py and R, and different workflows, used at the Utah Public Health Laboratory (UPHL) for SARS-CoV-2 data analysis after the Illumina dragen COVID pipeline finished the analysis phase.

##### Run automatic:
      TThere is a screen in LWS/testing that runs an R script "Detecting_Finished_Illumina pipeline.R) 
      that detects the file covised_complete_nf.txt that will trigger the nfCovid workflow.
      
#### Run mannualy:
     nextflow run /Volumes/......./nfCovid.nf --paramito 'runname' 
     i.e. nextflow run /Volumes/....../nfCovid.nf --paramito 'UT-VH00770-231221'


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

