#!/bin/bash

# untar your R installation
tar -xzf R361.tar.gz
tar -xzf packages.tar.gz
gunzip $1.csv.gz

# make sure the script will use fyour R installation, 
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

# run your script
Rscript group3.R $1  # note: the actual command-line arguments
                  # go in hw4.sub's "arguments = " line
rm $1.csv
