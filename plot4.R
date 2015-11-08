setwd("~/Desktop/Coursera/DataScience/ExploratoryData/ExData_Plotting1")
householdFile <- file("household_power_consumption.txt")
data <- read.table(householdFile, header=T, sep=";", na.strings="?")

## set time
dateData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
setTime <-strptime(paste(dateData$Date, dateData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(setTime, dateData)

## plot graph
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

plot(finalData$setTime, as.numeric(as.character(finalData$Global_active_power)), type = "l", col = "black", xlab = " ", ylab = "Global Active Power")

plot(finalData$setTime, as.numeric(as.character(finalData$Sub_metering_1)), type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(finalData$setTime, as.numeric(as.character(finalData$Sub_metering_2)), type = "l", col = "red")
lines(finalData$setTime, as.numeric(as.character(finalData$Sub_metering_3)), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

plot(finalData$setTime, as.numeric(as.character(finalData$Voltage)), type = "l", col = "black", xlab = "datetime", ylab = "Voltage")

plot(finalData$setTime, as.numeric(as.character(finalData$Global_reactive_power)), type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()