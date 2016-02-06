#Plot 2 code
#Load in necessary libraries
library(dplyr)
#Reads in data from file
#power <- read.csv("household_power_consumption.txt", header=TRUE,sep =";",na.strings="?",stringsAsFactors = FALSE)
power <- read.csv("./household_power_consumption.txt", header=TRUE,sep =";",na.strings="?",stringsAsFactors = FALSE)
#format date fieldlibrary
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
#select dates of interest
mydf <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
#Convert fields to character and numeric as needed
mydf$Global_active_power <- as.numeric(as.character(mydf$Global_active_power))
mydf$Global_reactive_power <- as.numeric(as.character(mydf$Global_reactive_power))
mydf$Voltage <- as.numeric(as.character(mydf$Voltage))
#format time information correctly
mydf <- transform(mydf, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
mydf$Sub_metering_1 <- as.numeric(as.character(mydf$Sub_metering_1))
mydf$Sub_metering_2 <- as.numeric(as.character(mydf$Sub_metering_2))
mydf$Sub_metering_3 <- as.numeric(as.character(mydf$Sub_metering_3))
#Plot 2
plot(mydf$timestamp,mydf$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("Save plot2.png to", getwd())