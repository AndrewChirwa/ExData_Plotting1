#Read in Data
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?")
data <- data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

## Generating Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, 
     {
       plot(Global_active_power ~ Datetime, type = "l", 
            ylab = "Global Active Power", xlab = "")
       plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
       plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
       lines(Sub_metering_2 ~ Datetime, col = 'Red')
       lines(Sub_metering_3 ~ Datetime, col = 'Blue')
       legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
     }
)
dev.copy(device = png, filename = 'Plot4.png', width = 480, height = 480) 
dev.off()

