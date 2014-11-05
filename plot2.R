# script reads the data from the unzipped file from 
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# the script makes a line chart of the Global_active_power variable of the dates
# 01/02/2007 and 02/02/2007 (dd,mm,yyyy). Writes the line chart to a png file.

DT1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
DT2 <- DT1[DT1$Date == "1/2/2007",]
DT3 <- DT1[DT1$Date == "2/2/2007",]
DTfinal <- rbind(DT2,DT3)

DTdate <- DTfinal
# merges the Date and Time columns into a new column with the name "dt".
# converts the "dt" variable into a time/date class
DTdate$dt <- paste(DTdate$Date, DTdate$Time)
DTdate$dt <- strptime(as.character(DTdate$dt), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
with(DTdate, plot(dt, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))

# set the local computer into english (I live in the Netherlands so this step is neccesary)
Sys.setlocale(category = "LC_ALL", "C")
dev.off()