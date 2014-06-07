## We want to plot 3 different dependent variables with the same independent variable
## onto the same graph.

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
png("plot3.png", height = 480, width = 480)

## Plot the 3 lines
plot(DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering")
points(DateTime, data$Sub_metering_2, type="l", col="red")
points(DateTime, data$Sub_metering_3, type="l", col="blue")

## The legend
legend("topright", lwd=c(1, 1, 1), col=c("black", "red", "blue"), border=c(1, 4, 1, 1),
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close png file
dev.off()