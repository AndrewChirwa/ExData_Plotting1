#Read in Data
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?")
data <- data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

##  Plot 3
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(device = png, filename = 'Plot3.png', width = 480, height = 480) 
dev.off()

