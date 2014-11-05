# script reads the data from the unzipped file from 
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# the script four charts:
# chart 1: line chart of the Global_active_power variable in relation with the date/time
# chart 2: line chart of the Voltage variable in relation with the date/time
# chart 3: combined chart of the Sub_metering_1, Sub_metering_2, Sub_metering_3 variables in relation with the date/time
# chart 4: line chart of the Global_reactive_power variable in relation with the date/time
# in relationship with the date and time (01/02/2007 and 02/02/2007 (dd,mm,yyyy)). 
# It writes the charts to a png file.


DT1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
DT2 <- DT1[DT1$Date == "1/2/2007",]
DT3 <- DT1[DT1$Date == "2/2/2007",]
DTfinal <- rbind(DT2,DT3)

DTdate <- DTfinal
# merges the Date and Time columns into a new column with the name "dt".
# converts the "dt" variable into a time/date class
DTdate$dt <- paste(DTdate$Date, DTdate$Time)
DTdate$dt <- strptime(as.character(DTdate$dt), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(DTdate, plot(dt, Global_active_power, type = "l", ylab="Global Active Power", xlab="", cex.lab=0.90))
with(DTdate, plot(dt, Voltage, type = "l", ylab="Voltage", xlab="datetime", cex.lab=0.90))
with(DTdate, plot(dt,Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n", cex.lab=0.90)) 
with(DTdate, points(dt, Sub_metering_1, col="black", type = "l"))
with(DTdate, points(dt, Sub_metering_2, col="red", type = "l"))
with(DTdate, points(dt, Sub_metering_3, col="blue", type = "l"))
legend("topright", bty="n",lwd=2, cex=0.90 , col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(DTdate, plot(dt, Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime", cex.lab=0.90))

# set the local computer into english (I live in the Netherlands so this step is neccesary)
Sys.setlocale(category = "LC_ALL", "C")
dev.off()