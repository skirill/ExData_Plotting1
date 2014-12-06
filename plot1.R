# Loading data
archive    <- "exdata_data_household_power_consumption.zip"
data       <- read.table(unz(archive, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")
data1      <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
rm(data)
data1$Time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
data1$Date <- strptime(data1$Date, "%d/%m/%Y")

# Plotting
hist(data1$Global_active_power,
     col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
