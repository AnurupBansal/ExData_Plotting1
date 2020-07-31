data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")  ## reading the data
d <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")  ## subsetting the data

l <- as.numeric(d$Global_active_power)    ## taking out the required column into a vector

png("plot1.png", width = 480, height = 480)   ## initiating the graphic device
hist(l, col = "red", xlab = "Global Active Power (killowatts)", ylab = "Frequency", main = "Global Active Power")  ## making plot
dev.off()   ## Saving the plot and closing the graphic device