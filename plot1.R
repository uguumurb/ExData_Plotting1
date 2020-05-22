source("DownloadingAndCleaningData.R")
#Setting graphics device to PNG
png(filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px")
#Creatin plot # 1
with(neededData,
     hist(Global_active_power,
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)",
          col="red"))
dev.off()
