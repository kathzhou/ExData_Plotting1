setwd("~/Desktop/Coursera/DataScience/ExploratoryData/ExData_Plotting1")
householdFile <- file("household_power_consumption.txt")
data <- read.table(householdFile, header=T, sep=";", na.strings="?")

## set time
dateData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
setTime <-strptime(paste(dateData$Date, dateData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(setTime, dateData)

## plot historgram
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(finalData$Global_active_power)), col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()