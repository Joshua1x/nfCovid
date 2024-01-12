#!/usr/bin/env nextflow

nextflow.enable.dsl=2
Basepath = System.getProperty("user.dir")

println("") 
println(" ____ _____ __      _____ _____")
println("/ ___|  _  |\\ \\    / /| || __  \\")
println("| |  | | | | \\ \\  / / | || | | |")
println("| |__| |_| |  \\ \\/ /  | || |_| |")
println("\\__ _|_____|   \\_ /   |_||_____/ ")



VERSION = '1.2-July-27'
Author ="Olinto Linares-Perdomo"
LastModified="2023-08-28"
USAGE = "Putting all covid files in a nf/workflow. This workflow will be activated when the analysis pipeline has finished  (covidseq_complete_nf.txt)"

println() ;println("Version: " + VERSION) ;println("Author: " + Author)
println("Last modified: " + LastModified); println("USAGE: " + USAGE);println()

params.paramito  = ''

// === process 1
process fastas { 
input:
  val runName
output:
 val start
 script: start ="$params.paramito"

"""
Rscript /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/parFastas.R $runName
"""
 }

// === process 2
process cecret_nextclade_pangolin_and_nextstrain_clade {
USAGE = """
        This process will trigger the Cecret workflow for pangolin and nextsrain-clade clasification.
       """
input:
    val runName
output:
     val start

  script: start = "$params.paramito"
  print("")
 """
 bash /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/cCecret.sh $params.paramito
 """
}

// ==== process 3

process ngs_summary_track_submission_files {
USAGE = """
        This process will trigger an  R script that collect data from LIMS and frm the previous process to generte the followings files:
          1. ngs_runName.csv: file for surveillance
          2. summary.csv : file for basic stats
          3. tracking.csv file that be used downstrain  to update the tracking system finished tab.
          4. submission.csv: This file has all the samples that passed and will be used downstrain to prepare the data for submission t different DBs).
      """
input:
   val runName
output:
      val start

      script:  start = "$params.paramito"
      println("")
 """
 Rscript /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/ngs_summary_tracking_submission_files.R  $params.paramito
 """
}

// ==== process 4

process fastas2json {
USAGE =  """
           Generating the fastas to json file. It use a py version but an R version is ready to be used
        """
input: 
 val runName


output:
 val start
 script: start ="$params.paramito"

script:
print("")
"""
Rscript /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/fastas2json.R $runName
"""
}

// === process 5
process movingJson {

USAGE =  """
           Moving json file from json folder to working_json folder
        """
input:
 val runName

output:
 val start
 script: start ="$params.paramito"

script:
print("")
"""
Rscript /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/json2working_json.R $runName
"""

}

// ==== process 6
process Dripping_Rock {
USAGE =  """
           Triggering the Dripping_Rock workflow
        """
input:
 val runName

script:
print("")
"""
Rscript /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/RDripping_RockTriger.R $runName
"""
}

// === process 7
process UpdatingTrackingFinishedTab {
USAGE = """
        This process is will actualize the tracking systems finished tab
       """
 input:
   val fromngs_summary_track_submission_files
 script:
 print("")
 """
 Rscript /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/ActualizingTrackingFinishedTap.R $params.paramito
 """
 }

// ==== process 8
process preparing_files_for_submission {
USAGE = """
         This process will prepare the data files for submission to NCBI/(SRA &  GenBank)k and GISAID
         """
input:
  val runName

output:
  val runName

script: runName ="$params.paramito"
print("s")

"""
bash /Volumes/NGS/Bioinformatics/Lin/nfCovidFiles/prepare_submission_baseline_surveillance-2023.sh \
     /Volumes/NGS/Analysis/covidseq/$params.paramito/ \
     /Volumes/NGS/Analysis/covidseq/$params.paramito/submission.csv
"""
}

workflow {
// fastas(params.paramito)

// process 1,2,3 & 8 have the same input/output and must be executed in sequence
preparing_files_for_submission(ngs_summary_track_submission_files(cecret_nextclade_pangolin_and_nextstrain_clade(fastas(params.paramito))))

UpdatingTrackingFinishedTab(ngs_summary_track_submission_files.out)

// process 4,5,& 6 for daily_metadata have the same input/output and must be executed in sequence
Dripping_Rock(movingJson (fastas2json(params.paramito))) 
}

workflow.onComplete {
   println("nfCOVID workflow completed at: $workflow.complete with execution status: ${ workflow.success ? 'OK' : 'failed' }")
 }

