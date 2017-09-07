hpc <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE)

hpc1 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

hpc1$Date <- strptime(paste(hpc1$Date, hpc1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(hpc1$Date, hpc1$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = " ")

lines(hpc1$Date,hpc1$Global_active_power)

dev.copy(png, file = "plot2.png")
dev.off()