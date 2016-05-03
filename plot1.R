#Read in Data
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?")
data <- data[which(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))

hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0,1200), xlim = c(0, 6)
     , xaxp = c(0, 6, 3))

dev.copy(device = png, filename = 'Plot1.png', width = 480, height = 480) 
dev.off()

