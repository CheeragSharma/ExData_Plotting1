hpc <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE)

hpc1 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

hpc1$Date <- strptime(paste(hpc1$Date, hpc1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2)).

plot(hpc1$Date, hpc1$Global_active_power, type = "n", ylab = "Global Active Power", xlab = " ")
lines(hpc1$Date,hpc1$Global_active_power, col = "black")

plot(hpc1$Date, hpc1$Voltage, type = "n", ylab = "Volatge", xlab = "datetime")
lines(hpc1$Date,hpc1$Voltage, col = "black")

plot(hpc1$Date, hpc1$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " ")
lines(hpc1$Date,hpc1$Sub_metering_1, col = "black")
lines(hpc1$Date,hpc1$Sub_metering_2, col = "red")
lines(hpc1$Date,hpc1$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, lty = c(1))

plot(hpc1$Date, hpc1$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(hpc1$Date,hpc1$Global_reactive_power, col = "black")

dev.copy(png, file = "plot4.png")
dev.off()
  
)