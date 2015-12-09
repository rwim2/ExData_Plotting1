setwd("C:/Users/rwim2/Desktop/R-Coursera")

mydata <- read.table("data/household_power_consumption.txt", header=TRUE, 
              sep=";",na.strings = "?", 
              colClasses = c("character", "character", "numeric","numeric","numeric", 
                             "numeric","numeric","numeric","numeric"))

mydata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time),"%d/%m/%Y %H:%M:%S")

## Graph #1
par(mfrow = c(1, 1),mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
hist(mydata$Global_active_power,col="RED",main="Global Active Power",
     ylab="Frequency", xlab="Global Active Power (kilowatts)") 
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()  ## Close the PNG device!
