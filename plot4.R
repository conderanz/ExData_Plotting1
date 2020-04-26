# Set working directory
setwd("C:/Hernan/Kimberly/Data Science/Training/Coursera/Module 4/Course Project 1")

# Read file
f <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
nrow(f)

# Change column types
f$DateTime <- paste(f$Date, f$Time)
f$DateTime <- strptime(f$DateTime,format="%d/%m/%Y %H:%M:%S")
f$Date <- as.Date(f$Date, format="%d/%m/%Y")

# Filter data
f <- f[(f$Date>="2007-02-01") & (f$Date<="2007-02-02"),]
nrow(f)

# Change factor to numeric
f$Global_active_power <- as.numeric(levels(f$Global_active_power))[f$Global_active_power]
f$Global_reactive_power <- as.numeric(levels(f$Global_reactive_power))[f$Global_reactive_power]
f$Voltage <- as.numeric(levels(f$Voltage))[f$Voltage]
f$Sub_metering_1 <- as.numeric(levels(f$Sub_metering_1))[f$Sub_metering_1]
f$Sub_metering_2 <- as.numeric(levels(f$Sub_metering_2))[f$Sub_metering_2]

# Create plot

## Launch graphics device
png("plot4.png", width=480, height=480, units="px")

## Create plot
par(mfrow = c(2,2))
plot(f[,c(10,3)],type="l",ylab="Global Active Power",xlab="")
plot(f[,c(10,5)],type="l",ylab="Voltage",xlab="datetime")
plot(f[,c(10,7)],type="l",ylab="Energy sub metering",xlab="")
points(f[,c(10,8)],type="l",col="red")
points(f[,c(10,9)],type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(f[,c(10,4)],type="l",xlab="datetime")

## Close graphics device
dev.off()