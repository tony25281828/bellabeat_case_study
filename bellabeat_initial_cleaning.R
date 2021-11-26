### Google Case Study 2: R Script 1 - reformat datetime values

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# This R script initially clean data in order to import to BigQuery. 
# Data to be cleaned include
# 1. Reformat datetime values to a specific format in order to  
# 2. Round double to the second decimal
# 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



#==========================
# STEP 1: SET ENVIRONMENT
#==========================

# Set working directory
setwd("~/Tony/work/Google_Data_Analytics/Course8/Week2/C8W2L2_Case_study_track1/Case_Study2")

# Load required library
library(tidyverse)
library(readr)
library(dplyr)
library(lubridate)
library(stringr)

# Set variable
ORIGINAL_FILE_PATH <- 'data/dailySteps_merged.csv'
s <- strsplit(ORIGINAL_FILE_PATH, '\\.')
NEW_FILE_PATH <- paste0(s[[1]][1], '_v2.csv')



#===========================================================
# STEP 2: LOAD DATA
# NOTE: LOAD DATASET WHICH HAS DATE AND TIME
#===========================================================

# Load data from datasets. Change file name if want to reformat a specific file
original_file = read.csv(ORIGINAL_FILE_PATH)
new_file <- original_file

# View basic structure of the file
str(original_file)
#head(original_file)


#===========================================================
# STEP 3: REFORMAT TIME
#===========================================================

# Check if the second column is date or datetime
if (str_length(original_file[,2][1]) <= 10){
  # Change string to date format
  datetime_temp <- original_file[,2] %>% 
    strptime('%m/%e/%Y')
} else {
  # Change string to datetime format
  datetime_temp <- original_file[,2] %>% 
    strptime('%m/%e/%Y %I:%M:%S %p')
}


# Change date or datetime format to string
datetime_temp <- strftime(datetime_temp)

# Replace the second column of the new_file
new_file[,2] <- datetime_temp

head(new_file)



#===========================================================
# STEP 4: ROUND DECIMAL
#===========================================================

# Use forloop to lookup all columns
for (x in 1:ncol(original_file)){
  # If datatype of the column is double
  if (typeof(original_file[,x]) == 'double') {
    # Round the double and replace the column with temp column
    double_col_temp <- round(original_file[,x], 2)
    new_file[,x] <- double_col_temp
    # Show columns effected
    print(colnames(select(new_file, x))[1])
  }
}





#===========================================================
# STEP 5: OUTPUT CSV FILE
#===========================================================

head(new_file)
write.csv(new_file, NEW_FILE_PATH, row.names = FALSE, quote = FALSE)


