# Load dataset
dataset <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings = "?",
                      colClasses=c(Global_active_power="numeric"))

# Keep only rows with dates 2007-02-01 or 2007-02-02.
dataset <- dataset[as.character(dataset$Date) == '1/2/2007' | as.character(dataset$Date) == '2/2/2007',]
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset$DateTime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width=480, height=480)

# Plot
with(dataset, plot(DateTime, Global_active_power,
                   xlab="",
                   ylab="Global Active Power (kilowatts)",
                   type='l'))

dev.off()