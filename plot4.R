#Read file and save into data frame
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

#Format dates
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

#Subset data between required dates
data<-df[df$Date>= "2007-02-01" & df$Date <= "2007-02-02", ]

# Convert date and time variables
date_time <- paste(as.Date(data$Date), data$Time)
data$Time <- as.POSIXct(date_time)

# Set up panel for plotting in 2 rows and 2 columns
par(mfrow=c(2,2))

# Plot 1 (top-left)
plot(data$Time, data$Global_active_power, xlab="", ylab="Global Active Power", type ="l")

# Plot 2 (top-right)
plot(data$Time, data$Voltage, xlab="datetime", ylab="Voltage", type = "l")

# Plot 3 (bottom-left)
plot(data$Time, data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),
       lty=c(1,1,1),lwd=c(2.0,2.0,2.0),col=c("black","blue","red"), 
       x=max(data$time)-1.5, y=max(data$Sub_metering_1)+1,pch=2 )

# Plot 4 (bottom-right)
plot(data$Time, data$Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power")
lines(data$Time, data$Global_reactive_power)

## Save data to png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
