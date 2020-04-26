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

# Change factor to numeric (I don't know the reason of the "[f$Global_active_power]" but it's the only way it works)
f$Global_active_power <- as.numeric(levels(f$Global_active_power))[f$Global_active_power]

# Create plot

## Launch graphics device
png("plot2.png", width=480, height=480, units="px")

## Create plot
plot(f[,c(10,3)], type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Close graphics device
dev.off()