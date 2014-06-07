## We want to use the plot() to plot the actuals

## Load
data <- read.table("/Users/Lynna/Downloads/household_power_consumption.txt", header=T, sep=";", na.strings="?")

## We only want data from 1/2/2007 and 2/2/2007	
data <- subset(data,
	data$Date == "1/2/2007" |
	data$Date == "2/2/2007") 

## Create new variable by joining Date and Time
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Use column bind to add the new variable to the data
data <- cbind(DateTime, data)

## Open png file
png("plot2.png", height = 480, width = 480)

## Build histogram using the DateTime variable and the Global_active_power
plot(DateTime, data$Global_active_power, 
	type="l", ylab="Global Active Power")

## Close png file
dev.off()