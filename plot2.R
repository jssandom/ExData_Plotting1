# For code below to work, ensure that data is unzipped and saved in working directory

# Load dataset, add 'datetime' column and subset data (if not already done)
consumption <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, stringsAsFactors = FALSE)
datetime <- strptime(paste(consumption$Date, consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
consumption <- cbind(datetime,consumption)
feb1feb2 <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007"),]

# construct plot
feb1feb2 <- feb1feb2[order(feb1feb2$datetime),]
png("plot2.png", width=480, height=480)
with(feb1feb2, plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()