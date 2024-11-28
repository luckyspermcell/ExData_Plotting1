#Read the data                                                                                                                                                                                        +         Sub_metering_3 = col_number()), trim_ws = TRUE)
household_power_consumption <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)

#Transform the "Date" column to a date format. Make a new column called "posix", where date and time are stored.

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption$posix <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

#Transform the "Global Active Power" column to numeric
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

#Data only from the two required dates
data<- household_power_consumption[household_power_consumption$Date == "2007-02-01"
                                   | household_power_consumption$Date == "2007-02-02", ]

png(filename = "plot2.png", height = 480, width = 480, units = "px")
with(data, plot(posix, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()