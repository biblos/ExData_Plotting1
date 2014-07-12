# Load dataset
dataset <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings = "?",
                    colClasses=c(Global_active_power="numeric",
                                 Global_reactive_power="numeric",
                                 Voltage="numeric",
                                 Global_intensity="numeric",
                                 Sub_metering_1="numeric",
                                 Sub_metering_2="numeric",
                                 Sub_metering_3="numeric"))

# Keep only rows with dates 2007-02-01 or 2007-02-02.
dataset <- dataset[as.character(dataset$Date) == '1/2/2007' | as.character(dataset$Date) == '2/2/2007',]

png(file="plot1.png", width=480, height=480)

# Histogram
hist(dataset$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()
