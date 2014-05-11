# Set the working directory
setwd("/Users/tijlkindt/Documents/GitHub/Data Science Specialization/4) Exploratory Data Analysis/Project 1")

# Read in the power consumption data
powercons <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Convert Date and Time to a DateTime variable
powercons$DateTime <- strptime(paste(powercons$Date,powercons$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# Subset the data so we only have data from February 1st and 2nd in 2007
powerconssub <- subset(powercons, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03") )

# Open a png-file for writing
png(file="plot4.png",width=480,height=480)

# Define the layout
par(mfrow=c(2,2))

# Do the first plot (top left, global active power)
with(powerconssub, plot(DateTime,Global_active_power, xlab="",type="l",
                        ylab="Global Active Power (kilowatts)"))

# Do the second plot (top right, Voltage)
with(powerconssub, plot(DateTime,Voltage, xlab="",type="l",
                        ylab="Voltage"))

# Do the third plot (bottom left, Energy sub metering)
with(powerconssub, plot(DateTime,Sub_metering_1, xlab="",type="l",
                        ylab="Energy sub metering"))
with(powerconssub, lines(DateTime,Sub_metering_2, col="red"))
with(powerconssub, lines(DateTime,Sub_metering_3, col="blue"))
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=c(1,1,1),
       bty="n")

# Do the fourth plot (bottom right, Global Reactive Power)
with(powerconssub, plot(DateTime,Global_reactive_power, xlab="",type="l",
                        ylab="Global_reactive_power"))

# Close the file
dev.off()