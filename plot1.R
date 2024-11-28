#Read the data                                                                                                                                                                                        +         Sub_metering_3 = col_number()), trim_ws = TRUE)
household_power_consumption <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)

#Transform the "Date" column to a date format. Transform the "Global Active Power" column to numeric
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

#Data only from the two required dates
data<- household_power_consumption[household_power_consumption$Date == "2007-02-01"
                                   | household_power_consumption$Date == "2007-02-02", ]

png(file ="plot1.png", height = 480, width = 480,units = "px")
plot<- hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red", 
     main = "Global Active Power")
dev.off()
