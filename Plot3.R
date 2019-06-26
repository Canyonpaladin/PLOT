data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", 
        colclass = c("character", "character", rep("numeric", 6)))
DATA <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")
time <- paste(DATA$Date, DATA$Time)
data1 <- cbind(time, DATA[3:9])
data1$time <- strptime(data1$time, "%d/%m/%Y %H:%M:%S")
with(data1, plot(time, Sub_metering_1, type = "l", 
     ylab= "Global Active Power (kilowatts)", xlab = ""))
lines(data1$time, data1$Sub_metering_2, type = "l", col = "red")
lines(data1$time, data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()