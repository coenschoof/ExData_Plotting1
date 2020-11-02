household_power_consumption <- read.csv("./household_power_consumption.txt", row.names=NULL, sep=";")

Sys.setlocale("LC_ALL","English")
target <- c("1/2/2007", "2/2/2007")
household_power_consumption <- household_power_consumption %>% filter(Date %in% target)

household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")


par(mfrow = c(2, 2))
par(mar = c(4,4,3,1))

plot(household_power_consumption$DateTime, as.numeric(household_power_consumption$Global_active_power), 
     ylab = "Global Active Power",
     xlab = " ",
     type = "l")

plot(household_power_consumption$DateTime, as.numeric(household_power_consumption$Voltage), 
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")

plot(household_power_consumption$DateTime, household_power_consumption$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = " ",
     type = "n"
)

points(household_power_consumption$DateTime, household_power_consumption$Sub_metering_1, col = "black", type = "l")
points(household_power_consumption$DateTime, household_power_consumption$Sub_metering_2, col = "red", type = "l")
points(household_power_consumption$DateTime, household_power_consumption$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(household_power_consumption$DateTime, as.numeric(household_power_consumption$Global_reactive_power), 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")


dev.off()