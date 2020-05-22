source("DownloadingAndCleaningData.R")
#Setting graphics device to PNG
png(filename = "plot3.png",
    width = 480,
    height = 480,
    units = "px")
# Creatin plot # 3
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
       legend=names(neededData)[6:8])
dev.off()
