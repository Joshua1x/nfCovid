#!/usr/bin/env Rscript
# Author: OLinares
# Usage: getting fastas for Cecret/pangolin
# input: args[1]
# last modified on 2023-08-22
library("tidyverse")
args = commandArgs(trailingOnly=T)
#args[1]<-c("UT-VH00770-230913")
# cat(args[1])
dir.create(paste("/Volumes/NGS/Analysis/covidseq",args[1],"ParFastas",sep ="/"));
file.copy(from=Sys.glob(paste("/Volumes/NGS/Analysis/covidseq/",args[1],
                              "/covidseq_output/Sample_Analysis/*/*.fasta",sep = ""),dirmark = TRUE), 
          to=paste("/Volumes/NGS/Analysis/covidseq",args[1],"ParFastas",sep ="/"),overwrite = TRUE, recursive = FALSE,copy.mode = F)
output_file= paste("/Volumes/NGS/Analysis/covidseq",args[1],"ParFastas",sep ="/")
cat(output_file)

