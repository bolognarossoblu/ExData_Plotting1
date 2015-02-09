# Plot 4. Course Project 1. Exploratory Data Analysis.

# Load package
# To install package enter: install.packages("sqldf")
require(sqldf)

# Load data, get subset, and create new "datetime" field
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data_subset$datetime <- strptime( paste (data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

# Open png graphic device
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))

# Draw plot 1 (top left).
plot(data_subset$datetime,data_subset$Global_active_power, cex=0, xlab="", ylab = "Global Active Power (kilowatts)")
lines(data_subset$datetime,data_subset$Global_active_power, lwd = 0.5, col = "black")

# Draw plot 2 (top right).
plot(data_subset$datetime,data_subset$Voltage, cex=0, xlab="", ylab = "Voltage")
lines(data_subset$datetime,data_subset$Voltage, lwd = 0.5, col = "black")

# Draw plot 3 (bottom left).
plot(data_subset$datetime, data_subset$Sub_metering_1, cex=0, xlab="", ylab = "Energy sub metering")
lines(data_subset$datetime,data_subset$Sub_metering_1, lwd = 0.5, col = "black") 
lines(data_subset$datetime,data_subset$Sub_metering_2, lwd = 0.5, col = "red")
lines(data_subset$datetime,data_subset$Sub_metering_3, lwd = 0.5, col = "blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), bty = "n", cex = 1)

# Draw plot 4 (bottom right).
plot(data_subset$datetime,data_subset$Global_reactive_power, cex=0, xlab="", ylab = "Global_reactive_power")
lines(data_subset$datetime,data_subset$Global_reactive_power, lwd = 0.2, col = "black")

# Close png graphic device
dev.off()