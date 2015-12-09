setwd("C:/Users/rwim2/Desktop/R-Coursera")

mydata <- read.table("data/household_power_consumption.txt", header=TRUE, 
              sep=";",na.strings = "?", 
              colClasses = c("character", "character", "numeric","numeric","numeric", 
                             "numeric","numeric","numeric","numeric"))

mydata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time),"%d/%m/%Y %H:%M:%S")

## Graph #4
par(mfrow = c(2, 2),mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
with(mydata, plot(datetime, Global_active_power, col="BLACK",type="l",
                  ylab="Global Active Power", xlab="")) 
with(mydata, plot(datetime, Voltage, col="BLACK",type="l")) 
with(mydata, plot(datetime, Sub_metering_1, 
                  ylab="Energy sub metering", xlab="", type="n"))
with(mydata, lines(datetime, Sub_metering_1, col="BLACK", type="l"))
with(mydata, lines(datetime, Sub_metering_2, col="RED", type="l"))
with(mydata, lines(datetime, Sub_metering_3, col="BLUE", type="l"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.7, bty="n", lwd=1, lty=c(1,1,1),seg.len=2)
with(mydata, plot(datetime, Global_reactive_power, col="BLACK",type="l"))
dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off()  ## Close the PNG device!
