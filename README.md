# nfCovid

Purpose

nfCovid is the collection of scripts in bash, py and R, and different workflow used at the Utah Public Health Laboratory (UPHL) for SARS-CoV-2 data analysis after the Illumina dragen COVID pipeline finished the analysis phase detecting the copy_complete.txt file. 

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

Run automatic

### Run mannualy
nextflow run nfCovidV4.nf --paramito 'runname' 
    i.e. nextflow run nfCovidV4.nf --paramito 'UT-VH00770-231221'

    


Getting the json file for workflow incorporation with bin/fasta_to_json.py

Dripping_Rock/bin/fasta_to_json.py <run id>
This takes the matched file, the two LIMS exports, the EpiTrax export, and the fasta files in order to create a json file for the run in /Volumes/IDGenomics_NAS/COVID/daily_metadata/json/<run id>.json. A <run id>_missing.json will also be created. Requires "Statewide Positive COVID - Kelly O" export.

If the json file looks good, copy the json file to /Volumes/IDGenomics_NAS/COVID/daily_metadata/working_json

cp /Volumes/IDGenomics_NAS/COVID/daily_metadata/json/<run id>.json /Volumes/IDGenomics_NAS/COVID/daily_metadata/working_json/.
Running nextflow

Make a directory with the date at /Volumes/IDGenomics_NAS/COVID/daily_metadata/ and cd into it

Example:

mkdir /Volumes/IDGenomics_NAS/COVID/daily_metadata/2021-11-30
cd /Volumes/IDGenomics_NAS/COVID/daily_metadata/2021-11-30
nextflow run /home/Bioinformatics/Dripping_Rock
This creates a metadata file at dripping_rock/UPHL_metadata.csv in the new directory. Requires "Statewide Positive COVID - Kelly O" and "COVID Lineage - Erin Y" exports.
