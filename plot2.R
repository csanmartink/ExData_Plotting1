
#==============================================================================
#
#       Course: Exploratory Data Analysis
#       Assignment: 1 - Plot 2
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

# Prevents Scientific Notation
HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
HPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


#########       Plot 2      ====================================================

png("plot2.png", width=480, height=480)

        plot(x = HPC[, dateTime]
             , y = HPC[, Global_active_power]
             , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
