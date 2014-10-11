################################################################################
### script for building plo1.png from Coursera EDA Course Project 1 ############
################################################################################

# you should change path according to ypur system
setwd("C:/Users/gregory/Documents/!Projects/Trainings/Coursera - Exploratory Data Analysis/EDA-CP1")

# Data was downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# on 08.10.2014. I consider it too big to put in GitHub.


# Unzip file
unzipped_file = unzip("exdata-data-household_power_consumption.zip")

# read data
power_cons_data = read.table(unzipped_file,header=TRUE,sep=";",na.strings = "?")




unlink (unzipped_file) # delete unzipped file
