DT1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
DT2 <- DT1[DT1$Date == "1/2/2007",]
DT3 <- DT1[DT1$Date == "2/2/2007",]
DTfinal <- rbind(DT2,DT3)
hist(DTfinal$Global_active_power)