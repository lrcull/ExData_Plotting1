
energy <- read.csv("energy.csv")

data <- energy[energy$Date == '1/2/2007' | energy$Date == '2/2/2007',]

DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
forPlot <- cbind(DateTime, data)

par(mfrow = c(2,2))

plot(forPlot$DateTime, forPlot$Global_active_power, type = "l", col = "black", xlab = " ", ylab = "Global Active Power (kilowatts)")

plot(forPlot$DateTime, forPlot$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(forPlot$DateTime, forPlot$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering", ylim=c(0,30))
par(new = TRUE)
lines(forPlot$DateTime, forPlot$Sub_metering_2, col = "red")
par(new = TRUE)
lines(forPlot$DateTime, forPlot$Sub_metering_3, col = "blue")

legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty = 'n', cex = .75)

plot(forPlot$DateTime, forPlot$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")


dev.copy(png, file = "Plot4.png")

dev.off()
