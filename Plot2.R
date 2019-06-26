data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", 
        colclass = c("character", "character", rep("numeric", 6)))
DATA <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")
time <- paste(DATA$Date, DATA$Time)
data1 <- cbind(time, DATA[3:9])
data1$time <- strptime(data1$time, "%d/%m/%Y %H:%M:%S")
with(data1, plot(time, Global_active_power, type = "l", 
            ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()