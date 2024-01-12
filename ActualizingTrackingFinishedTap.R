#!/usr/bin/env Rscript
# Author: OLP/01/2022
# Usage: sending results to Tracking/Finished tape
# Parameter: Run Name ;  i.e. Rscript ActualizingTrackingFinishedTap.R UT-VH077-230822
# last modified on 08-28-23

library("easypackages");libraries("grid","data.table","progress","XML","xml2","seqinr","data.table","readr","gargle","googlesheets4")
   args = commandArgs(trailingOnly=T); # args[1]<-c("UT-VH00770-230822")
   runPath <-paste('/Volumes/NGS/Analysis/covidseq',args[1],sep="/")
   sup <- suppressPackageStartupMessages; sup(library(lubridate)); sup(library(gargle));
   runPath <-paste('/Volumes/NGS/Analysis/covidseq',args[1],sep="/")
# getting the token
   tokenPar <- readRDS("/Volumes/NGS/Bioinformatics/Lin/secrets/7a6077d23f6776ccc63f8f70bc12b214_olinares-perdomo@utah.gov")
   gs4_auth(token = tokenPar)
 # accessing SASR-COV-2 NGS Tracking/Finished tab
   page<-"https://docs.google.com/spreadsheets/d/1N_d2V6XESUeGTlb-uJIe_yPkHBe5qqXLFWWXY86wJZU/edit#gid=572325282"
 
# Accessing results from Rsumcovidseq
   NGS_Tracking<-rownames(fileSnapshot(paste(runPath,"Rsumcovidseq/",sep="/"),
                                    pattern=glob2rx("NGS_Tracking*.csv"))$info[which.max(fileSnapshot(paste(runPath,"Rsumcovidseq/",sep="/"),
                                                                                                      pattern=glob2rx("NGS_Tracking*.csv"))$info$mtime),])
   
   NGS_Tracking
   RunResults<-read.csv(paste(paste(runPath,"Rsumcovidseq/",sep="/"), NGS_Tracking,sep = "/"), header = T)
   RunResults
   col_names<-c("Lab ID","Submission ID","Collection Date","Sequencing run","Pangolin Lineage (updated 2021-08-10)","Number of non-ambiguous bases","Clade")
   colnames(RunResults)<-col_names;
 
# adding new data to SARS-CoV-2 NGS Tracking/Finished tap  
   sheet_id<-page
   sheet_append(sheet_id, data = RunResults)
   cat(crayon::bold(nrow(RunResults), "columns have been added to SARS-CoV-2 NGS Tracking/Finished sheet ralated to run",args[1],"\n"))

  
