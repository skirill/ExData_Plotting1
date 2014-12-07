# Loading data
archive    <- "exdata_data_household_power_consumption.zip"
data       <- read.table(unz(archive, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")
data1      <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm(data)
data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
data1$Date <- strptime(data1$Date, "%d/%m/%Y")

# Plotting
png(file="plot2.png")
par(bg = "transparent")
plot(data1$Time, data1$Global_active_power,
     type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
