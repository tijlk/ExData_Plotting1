# Set the working directory
setwd("/Users/tijlkindt/Documents/GitHub/Data Science Specialization/4) Exploratory Data Analysis/Project 1")

# Read in the power consumption data
powercons <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time to a DateTime variable
powercons$DateTime <- strptime(paste(powercons$Date,powercons$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# Subset the data so we only have data from February 1st and 2nd in 2007
powerconssub <- subset(powercons, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03") )

# Plot a histogram
hist(powerconssub$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Copy to png
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
