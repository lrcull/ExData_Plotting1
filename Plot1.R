
energy <- read.csv("energy.csv")
data <- energy[energy$Date == '1/2/2007' | energy$Date == '2/2/2007',]

with(energy, hist(Global_active_power, col = "purple", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"                     ))
dev.copy(png, file = "Plot1.png")

dev.off()
