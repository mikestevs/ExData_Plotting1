#Read file and save into data frame
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

#Format dates
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

#Subset data between required dates
data<-df[df$Date>= "2007-02-01" & df$Date <= "2007-02-02", ]

# Convert date and time variables
date_time <- paste(as.Date(data$Date), data$Time)
data$Time <- as.POSIXct(date_time)

## Plot histo
plot(data$Global_active_power~data$Time, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## Save data to png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
