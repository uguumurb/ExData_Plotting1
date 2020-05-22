source("DownloadingAndCleaningData.R")
#Setting graphics device to PNG
png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px")
# Creatin plot # 2
with(neededData,
     plot(DateTime,
          Global_active_power,
          type="l",
          ylab="Global Active Power (kilowatts)",
          xlab=""))
dev.off()
