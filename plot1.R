## We want to plot the frequency of varible, Global Active Power.

## Load
data <- read.table("/Users/Lynna/Downloads/household_power_consumption.txt", header=T, sep=";", na.strings="?")

## We only want data from 1/2/2007 and 2/2/2007	
data <- subset(data,
	data$Date == "1/2/2007" |
	data$Date == "2/2/2007") 

## Open png file
png("plot1.png", height = 480, width = 480)

## Build histogram
hist(data$Global_active_power, col = "red", 
	xlab = "Global Active Power (kilowatts)", 
	ylab = "Frequency", 
	main = "Global Active Power")

## Close png file
dev.off()
