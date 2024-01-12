!/usr/bin/env Rscript
 # Author: OLP/12/2023
 # Usage: Trigger the Dripping_Rock work flow.
 # last modified on 23/12/28 "YY-MM-DD"
 library(stringr)
 while(TRUE) {
 path1<-"/Volumes/NGS/Analysis/covidseq"
 Lyapunovv<- Sys.glob(paste(path1,"*/covidseq_complete_nf.txt",sep = "/"),dirmark = TRUE)
 if(length(Lyapunovv) ==0){ Lyapunovv<-"Chaos_Theory"}
 Lyapunovv
 if (file.exists(Lyapunovv)) {
    select_part <- str_extract_all(Lyapunovv, "(?<=/)[^/]+")[[1]]; covid_run<-select_part[5]
    cat("The analysis phase for run",covid_run, "has ended, the nfCovid workflow will be triggered", "\n")
    nextflow_script <- "/Volumes/NGS/Bioinformatics/Lin/nfCovidFilesPractice/nfCovidV4Pract.nf --paramito 'covid_run'"
    system(paste("nextflow run", nextflow_script))


    # change the file name: covidseq_completed_nf.txt to covidseq_complete.txt"
    Lyapunovv2<-paste("/Volumes/NGS/Analysis/covidseq",covid_run,"covidseq_complete.txt",sep="/");
    file.rename(Lyapunovv, Lyapunovv2)

    } else {

 cat('\n')
 cat("\033[1mRunning nfCovidV4.nf in the background: Everything is completed, nothing to do for now\033[0m\n")


 }

 cat("\033[1;31mSleeping for 2 minutes...\033[0m\n")
 Sys.sleep(2*60)
 }
