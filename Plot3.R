
energy <- read.csv("energy.csv")

data <- energy[energy$Date == '1/2/2007' | energy$Date == '2/2/2007',]

DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
forPlot <- cbind(DateTime, data)

plot(forPlot$DateTime, forPlot$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering", ylim=c(0,30))
par(new = TRUE)
lines(forPlot$DateTime, forPlot$Sub_metering_2, col = "red")
par(new = TRUE)
lines(forPlot$DateTime, forPlot$Sub_metering_3, col = "blue")


legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty='n', cex=.75)

dev.copy(png, file = "Plot3.png")

dev.off()
