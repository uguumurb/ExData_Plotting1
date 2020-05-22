library(lubridate)
library(dplyr)
library(tidyr)
library(data.table)
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Creating folder for data
if (!file.exists("dataFolder")) { 
        dir.create("dataFolder") }
#Downloading the dataset
if (!file.exists("./dataFolder/rawdata.zip")){
        download.file(url, 
                      destfile = "./dataFolder/rawdata.zip", method="curl")
}  
#Unzipping the zip file
if (!file.exists("./dataFolder/household_power_consumption.txt")) { 
        unzip("./dataFolder/rawdata.zip",exdir = "./dataFolder")
}

#Reading the data using fread and putting into data table
# 1.Date: Date in format dd/mm/yyyy
# 2.Time: time in format hh:mm:ss
# 3.Global_active_power: household global minute-averaged active power (in kilowatt)
# 4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# 5.Voltage: minute-averaged voltage (in volt)
# 6.Global_intensity: household global minute-averaged current intensity (in ampere)
# 7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# 8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# 9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
rawData=fread(
        "./dataFolder/household_power_consumption.txt",
        colClasses=c(
                "character", 
                "character", 
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric"),
        na.strings="?")
#dataset missing values are coded as ?
#Converting Date and Time columns into timestamp
rawData$DateTime=dmy_hms(paste(rawData$Date,rawData$Time))
rawData$Date=NULL
rawData$Time=NULL
setcolorder(rawData,c(8,1:7))

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
neededData=filter(
        rawData,
        DateTime>=ymd_hms("2007-02-01 00:00:00")&
                DateTime<ymd_hms("2007-02-03 00:00:00"))
rm(rawData)
rm(url)