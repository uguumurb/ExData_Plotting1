source("DownloadingAndCleaningData.R")
#Setting graphics device to PNG
png(filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px")
# Creatin plot # 4
par(mfrow=c(2,2))
#Row 1 Col 1
with(neededData,
     plot(DateTime,
          Global_active_power,
          type="l",
          ylab="Global Active Power",
          xlab=""))
#Row 1 Col 2
with(neededData,
     plot(DateTime,
          Voltage,
          type="l",
          ylab="Voltage",
          xlab="datetime"))
#Row 2 Col 1
with(neededData,
     plot(DateTime,
          Sub_metering_1,
          type="l",
          ylab="Energy sub metering",
          xlab="",
          col="black"))
with(neededData,
     lines(DateTime,
           Sub_metering_2,
           col="red"))
with(neededData,
     lines(DateTime,
           Sub_metering_3,
           col="blue"))
legend("topright",
       lty=rep(1,3),
       col=c("blue","red"),
       legend=names(neededData)[6:8],
       bty="n")
#Row 2 Col 2
with(neededData,
     plot(DateTime,
          Global_reactive_power,
          type="l",
          ylab="Global_reactive_power",
          xlab="datetime"))
dev.off()
