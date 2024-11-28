#Read the data                                                                                                                                                                                        +         Sub_metering_3 = col_number()), trim_ws = TRUE)
household_power_consumption <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)

#Transform the "Date" column to a date format. Make a new column called "posix", where date and time are stored.

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption$posix <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

#Transform the "Global Active Power" column to numeric
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
household_power_consumption$Sub_metering_1 <- as.numeric(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_2 <- as.numeric(household_power_consumption$Sub_metering_2)
household_power_consumption$Sub_metering_3 <- as.numeric(household_power_consumption$Sub_metering_3)
household_power_consumption$Voltage <- as.numeric(household_power_consumption$Voltage)
household_power_consumption$Global_reactive_power <- as.numeric(household_power_consumption$Global_reactive_power)

#Data only from the two required dates
data<- household_power_consumption[household_power_consumption$Date == "2007-02-01"
                                   | household_power_consumption$Date == "2007-02-02", ]

png(filename = "plot4.png", height=480, width = 480, units = "px")
#plot
par(mfrow= c(2,2))
#plot 1
with(data, plot(posix, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
#plot 2
with(data, plot(posix, Voltage, type="l", xlab="datetime", ylab="Voltage"))
#plot 3
with(data, plot(posix, Sub_metering_1, type="l", col ="black", xlab="", ylab="Energy sub metering"))
with(data, points(posix, Sub_metering_2, type="l", col ="red"))
with(data, points(posix, Sub_metering_3, type="l", col ="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), cex = 0.5)
#plot 4
with(data, plot(posix, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
