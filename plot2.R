#Read in Data
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?")
data <- data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(device = png, filename = 'Plot2.png', width = 480, height = 480) 
dev.off()

