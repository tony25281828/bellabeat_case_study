### Google Case Study 2: R Script 2 - secondary cleaning 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# This R script clean data which contains negative value which a column 
# should not contain.
#
# Data to be cleaned include Value is negative  
# 
# Users have two options to clean the data including
# 1. Remove rows
# 2. Change to positive
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



#==========================
# STEP 1: SET ENVIRONMENT
#==========================

# Set working directory
setwd("~/Tony/work/Google_Data_Analytics/Course8/Week2/C8W2L2_Case_study_track1/Case_Study2")

# Load required library
library(tidyverse)
library(readr)
library(stringr)

# Set variable
ORIGINAL_FILE_PATH <- 'data/weightLogInfo_merged_v2.csv'
s <- strsplit(ORIGINAL_FILE_PATH, '_v2')
NEW_FILE_PATH <- paste0(s[[1]][1], '_v3.csv')



#=============================================
# STEP 2: LOAD DATA
# NOTE: LOAD DATASET WHICH HAS DATE AND TIME
#=============================================

# Load data from datasets. Change file name if want to reformat a specific file
original_file = read.csv(ORIGINAL_FILE_PATH)
new_file <- original_file

# View basic structure of the file
str(original_file)
#head(original_file)


#==============================================================
# STEP 3: FIND NEGATIVE VALUE, SHOW THE ROW AND MAKE DECISION
#==============================================================

# List of index which contain negative values
row_with_negative <- c()
column_with_negative <- c()

# Run through all columns and check if there is a value below 0
# Add the index into index_with_negative list
for (x in 1:ncol(original_file)) {
  r <- which(original_file[,x] < 0, arr.ind = TRUE)
  if (length((r)) != 0) {
    row_with_negative <- c(row_with_negative, r)
    column_with_negative <- c(column_with_negative, x)
  }
}

print(paste('Number of row containing negative value:', as.character(length(row_with_negative))))

if (length(row_with_negative) == 0) {
  head(new_file)
  write.csv(new_file, NEW_FILE_PATH, row.names = FALSE, quote = FALSE)
} else {
  original_file[row_with_negative,]
}



# Remove those rows
#new_file <- original_file[-row_with_negative,]

# Change them into positive value
#new_file[index_with_negative, 3:ncol(original_file)] <- abs(original_file[index_with_negative, 3:ncol(original_file)])



#===============================================
# STEP 4: OUTPUT CSV FILE IF VALUE IS MODIFIED
#===============================================

head(new_file)
write.csv(new_file, NEW_FILE_PATH, row.names = FALSE, quote = FALSE)














