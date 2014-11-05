# script reads the data from the unzipped file from 
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# the script makes a histogram of the Global_active_power variable of the dates
# 01/02/2007 and 02/02/2007 (dd,mm,yyyy). Writes the histogram to a png file.

DT1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
DT2 <- DT1[DT1$Date == "1/2/2007",]
DT3 <- DT1[DT1$Date == "2/2/2007",]
DTfinal <- rbind(DT2,DT3)
png("plot1.png", width=480, height=480)
hist(DTfinal$Global_active_power, xlab="Global Active Power (kilowatts)", main= "Global Active Power", col="red")
dev.off()