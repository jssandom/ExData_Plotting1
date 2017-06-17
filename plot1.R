# For code below to work, ensure that data is unzipped and saved in working directory

# Load dataset, add 'datetime' column and subset data
consumption <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, stringsAsFactors = FALSE)
datetime <- strptime(paste(consumption$Date, consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
consumption <- cbind(datetime,consumption)
feb1feb2 <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007"),]

# construct plot
globalactivepower <- as.numeric(feb1feb2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
