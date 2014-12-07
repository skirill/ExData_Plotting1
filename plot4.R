# Loading data
archive    <- "exdata_data_household_power_consumption.zip"
data       <- read.table(unz(archive, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")
data1      <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm(data)
data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
data1$Date <- strptime(data1$Date, "%d/%m/%Y")

# Plotting
png(file="plot4.png")
par(bg="transparent", mfrow = c(2, 2))
# 1,1
plot(data1$Time, data1$Global_active_power,
     type="l", main="", xlab="", ylab="Global Active Power")
#1,2
plot(data1$Time, data1$Voltage,
     type="l", main="", xlab="datetime", ylab="Voltage")
#2,1
plot(data1$Time, data1$Sub_metering_1, main = "", xlab="", ylab="Energy sub metering", type="l")
lines(data1$Time, data1$Sub_metering_2, col="red")
lines(data1$Time, data1$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), lty=1, bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#2,2
plot(data1$Time, data1$Global_reactive_power,
     type="l", main="", xlab="datetime", ylab="Global_reactive_power")
dev.off()
