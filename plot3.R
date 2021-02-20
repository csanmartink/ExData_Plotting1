
#==============================================================================
#
#       Course: Exploratory Data Analysis
#       Assignment: 1 - Plot 3
#       Author: Carolina San Martín
#       Date: 19/02/2021
#
#===============================================================================

#########       Getting the data      ==========================================
# Loading required packages
packages <- c("data.table")
for(p in packages) {
        if (!require(p,character.only = TRUE)) 
                install.packages(p); 
        library(p,character.only = TRUE)
}

# Setting the workdirectory
setwd("/Users/CG/Documentos/Rstudio Testing/4. Exploratory Data Analysis/Course Project 1/ExData_Plotting1")

# Download the dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "EDA_assignment1.zip", method="curl")
unzip("EDA_assignment1.zip") 

# Reads in data from file
HPC <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?")

# Making a POSIXct date capable of being filtered and graphed by time of day
HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
HPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


#########       Plot 3      ====================================================

png("plot3.png", width=480, height=480)

        plot(HPC[, dateTime], HPC[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
        lines(HPC[, dateTime], HPC[, Sub_metering_2],col="red")
        lines(HPC[, dateTime], HPC[, Sub_metering_3],col="blue")
        legend("topright"
               , col=c("black","red","blue")
               , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
               ,lty=c(1,1), lwd=c(1,1))

dev.off()
