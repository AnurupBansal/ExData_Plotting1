data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
d <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
d <- mutate(d, Date = as.Date(Date, format = "%d/%m/%Y"))

l <- as.numeric(d$Global_active_power)
total_time <- paste(as.character(d$Date),d$Time, sep = " ")
total_time <- strptime(total_time, format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(total_time, l, type = "l", xlab = " ", ylab = "Global Active Power(killowatts)")
dev.off()
