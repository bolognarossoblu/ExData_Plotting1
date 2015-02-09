# Plot 2. Course Project 1. Exploratory Data Analysis.

# Load package
# To install package enter: install.packages("sqldf")
require(sqldf)

# Load data, get subset, and create new "datetime" field
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data_subset$datetime <- strptime( paste (data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

# Open png graphic device, draw plot, and close graphic device
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(data_subset$datetime,data_subset$Global_active_power, cex=0, xlab="", ylab = "Global Active Power (kilowatts)")
lines(data_subset$datetime,data_subset$Global_active_power, col = "black")
dev.off()