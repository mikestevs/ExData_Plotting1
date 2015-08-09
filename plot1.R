#Read file and save into data frame
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

#Format dates
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

#Subset data between required dates
data<-df[df$Date>= "2007-02-01" & df$Date <= "2007-02-02", ]

# Plot histogram
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Save data to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
