Getting-and-Cleaning-Data
=========================

THe following instructions are are used to illustrate how to create a merged tidy data set based upon the data collected from the accelerometers from the Samsung Galaxy S smartphone in the "Human Activity Recognition Using Smartphones Data Set" experiment (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):


INSTRUCTIONS


1) Unzip source "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", and save to a location of your choice for which R read/write access is allowed. 

Unzipping this will create directory "UCI HAR Dataset".



2) Set your R working directory using setwd() to "UCI HAR Dataset".

Verify that it has been set correctly by running - getwd()



3) Download and save "run_analysis.R" to "UCI HAR Dataset".



4) Ensure that package "reshape2" is installed by running - library("reshape2") 

If it is not installed run - install.packages("reshape2")



5) In RStudio (for example) run - source("run_analysis.R")

This will create 2 files to your working directory for which you can do further analysis -
 (i)  "merged_tidy_data_set.txt", and
 (ii) "merged_tidy_data_set_averages.txt"

(i) corresponds to a 10299 x 68 data frame for all measurements and subjects with appropriate labeled activities.

(ii) corresponds to an aggregrated (mean) version of (i) on std and mean measurements as a 180 x 68 data frame.

