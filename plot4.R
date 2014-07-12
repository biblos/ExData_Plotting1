# Load dataset
dataset <- read.table("household_power_consumption.txt", sep=';', header=TRUE, na.strings = "?",
                      colClasses=c(Global_active_power="numeric",
                                   Global_reactive_power="numeric",
                                   Voltage="numeric",
                                   Sub_metering_1="numeric",
                                   Sub_metering_2="numeric",
                                   Sub_metering_3="numeric"))

# Keep only rows with dates 2007-02-01 or 2007-02-02.
dataset <- dataset[as.character(dataset$Date) == '1/2/2007' | as.character(dataset$Date) == '2/2/2007',]
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")


png(file="plot4.png", width=480, height=480)

par(mfrow = c(2, 2))
with(dataset, {
  
  plot(datetime, Global_active_power,
       xlab="",
       ylab="Global Active Power",
       type='l')
   
  plot(datetime, Voltage, type="l")
  
  {plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type='l')
   lines(datetime, Sub_metering_2, col='red')
   lines(datetime, Sub_metering_3, col='blue')
   legend("topright", lty=1, bty="n", col = c("black", "blue", "red"), 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))}
  
  plot(datetime, Global_reactive_power, type="l")
  
  
})

dev.off()
