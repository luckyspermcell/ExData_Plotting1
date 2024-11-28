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

#Data only from the two required dates
data<- household_power_consumption[household_power_consumption$Date == "2007-02-01"
                                   | household_power_consumption$Date == "2007-02-02", ]

png(filename = "plot3.png", height = 480, width = 480, units = "px")
with(data, plot(posix, Sub_metering_1, type="l", col ="black", xlab="", ylab="Energy sub metering"))
with(data, points(posix, Sub_metering_2, type="l", col ="red"))
with(data, points(posix, Sub_metering_3, type="l", col ="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), cex = 0.7)
dev.off()