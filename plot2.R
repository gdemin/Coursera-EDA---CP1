################################################################################
### script for building plot2.png from Coursera EDA Course Project 1 ############
################################################################################

# you should change path according to ypur system
setwd("C:/Users/gregory/Documents/!Projects/Trainings/Coursera - Exploratory Data Analysis/EDA-CP1")

# Data was downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# on 08.10.2014. I consider it too big to put it on GitHub.

# Unzip file
unzipped_file = unzip("exdata-data-household_power_consumption.zip")

# read data
power_cons_data = read.table(unzipped_file,header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE)

unlink (unzipped_file) # delete unzipped file

# take subset of dataset
power_cons_data = power_cons_data[power_cons_data$Date %in% c('1/2/2007','2/2/2007'),]

# convert characters to datetime
power_cons_data$datetime = strptime(paste(power_cons_data$Date,power_cons_data$Time),format="%d/%m/%Y %H:%M:%S")

# Set locale for correct (US) weekdays abbreviation
Sys.setlocale("LC_TIME", "us")

# Plot data to png device. 
png(filename="plot2.png", width = 480, height = 480)
plot(power_cons_data$datetime,power_cons_data$Global_active_power,
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.lab = 0.9
    )

dev.off()
