#Read file and save into data frame
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

#Format dates
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

#Subset data between required dates
data<-df[df$Date>= "2007-02-01" & df$Date <= "2007-02-02", ]

# Convert date and time variables
date_time <- paste(as.Date(data$Date), data$Time)
data$Time <- as.POSIXct(date_time)

plot(data$Time, data$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type = "l")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=c(1,1,1),lwd=c(2.0,2.0,2.0),
       col=c("black","red","blue"))

## Saves data to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
