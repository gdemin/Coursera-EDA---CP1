################################################################################
### script for building plot3.png from Coursera EDA Course Project 1 ############
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

# Plot data on png device to avoid legend cut-off. 
png(filename="plot3.png", width = 480, height = 480)
plot(power_cons_data$datetime,power_cons_data$Sub_metering_1,
     type="l",
     xlab = "",
     ylab = "Energy sub metering",
     cex.lab = 0.9
     )
lines(power_cons_data$datetime,power_cons_data$Sub_metering_2,col="red")
lines(power_cons_data$datetime,power_cons_data$Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,
       col=c("black","red","blue")
       )

dev.off()
