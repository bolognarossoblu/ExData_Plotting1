# Plot 1. Course Project 1. Exploratory Data Analysis.

# Load package
# To install package enter: install.packages("sqldf")
require(sqldf)

# Load data and get subset
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

# Open png graphic device, draw histogram, and close graphic device
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(data_subset$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "red")
dev.off()