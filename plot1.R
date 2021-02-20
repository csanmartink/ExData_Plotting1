
#==============================================================================
#
#       Course: Exploratory Data Analysis
#       Assignment: 1 - Plot 1
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

# Setting the workdirectoy
setwd("/Users/CG/Documentos/Rstudio Testing/4. Exploratory Data Analysis/Course Project 1/ExData_Plotting1")

# Download the dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "EDA_assignment1.zip", method="curl")
unzip("EDA_assignment1.zip") 

# Reads in data from file
HPC <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Date Column to Date Type
HPC$Date <- as.Date(HPC$Date, format="%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02
HPC <- HPC[(Date >= "2007-02-01") & (Date <= "2007-02-02")]


#########       Plot 1      ====================================================

png("plot1.png", width=480, height=480)

hist(HPC[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
