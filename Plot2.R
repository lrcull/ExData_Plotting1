
energy <- read.csv("energy.csv")

data <- energy[energy$Date == '1/2/2007' | energy$Date == '2/2/2007',]

DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
forPlot <- cbind(DateTime, data)

plot(forPlot$DateTime, forPlot$Global_active_power, type = "l", col = "black", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot2.png")
