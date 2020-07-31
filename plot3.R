data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
d <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
d <- mutate(d, Date = as.Date(Date, format = "%d/%m/%Y"))

l <- as.numeric(d$Global_active_power)
total_time <- paste(as.character(d$Date),d$Time, sep = " ")
total_time <- strptime(total_time, format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(total_time, as.numeric(d$Sub_metering_1), type = "n", xlab = " ", ylab = "Energy sub metering")
lines(total_time, as.numeric(d$Sub_metering_1))
lines(total_time, as.numeric(d$Sub_metering_2), col = "red")
lines(total_time, as.numeric(d$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

dev.off()