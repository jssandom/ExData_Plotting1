# For code below to work, ensure that data is unzipped and saved in working directory

# Load dataset, add 'datetime' column and subset data (if not already done)
consumption <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, stringsAsFactors = FALSE)
datetime <- strptime(paste(consumption$Date, consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
consumption <- cbind(datetime,consumption)
feb1feb2 <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007"),]

# construct plot
feb1feb2 <- feb1feb2[order(feb1feb2$datetime),]
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1))
with(feb1feb2, plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
with(feb1feb2, plot(datetime,Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
with(feb1feb2, plot(datetime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(feb1feb2, lines(datetime,Sub_metering_2, type = "l", col = "red"))
with(feb1feb2, lines(datetime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
with(feb1feb2, plot(datetime,Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()