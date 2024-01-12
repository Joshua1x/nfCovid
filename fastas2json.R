#!/usr/bin/env Rscript
# Author: OLP/01/2022
# Usage: fastas2json
# Parameter: Run Name ;  i.e. Rscript fastas2json.R UT-VH00770-230828
# last modified on 23/0822

library("easypackages");libraries("grid","data.table","progress","XML","xml2","data.table","readr");args = commandArgs(trailingOnly=T);
args[1]<-c("UT-VH00770-231221")

# json files: fastas2json 
# ========================
 path2python<-paste("python3 /home/Bioinformatics/Dripping_Rock/bin/fasta_to_json.py",args[1],sep = " ")
 path2python
 system(path2python)


