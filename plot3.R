# Plot 3. Course Project 1. Exploratory Data Analysis.

# Load package
# To install package enter: install.packages("sqldf")
require(sqldf)

# Load data, get subset, and create new "datetime" field
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data_subset$datetime <- strptime( paste (data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

# Open png graphic device, draw plot, and close graphic device
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")
plot(data_subset$datetime, data_subset$Sub_metering_1, cex=0, xlab="", ylab = "Energy sub metering")
lines(data_subset$datetime,data_subset$Sub_metering_1, col = "black") 
lines(data_subset$datetime,data_subset$Sub_metering_2, col = "red")
lines(data_subset$datetime,data_subset$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
dev.off()