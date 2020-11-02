household_power_consumption <- read.csv("./household_power_consumption.txt", row.names=NULL, sep=";")

Sys.setlocale("LC_ALL","English")
target <- c("1/2/2007", "2/2/2007")
household_power_consumption <- household_power_consumption %>% filter(Date %in% target)

household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")


png(filename = "plot3.png")


plot(household_power_consumption$DateTime, household_power_consumption$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = " ",
     type = "n"
)

points(household_power_consumption$DateTime, household_power_consumption$Sub_metering_1, col = "black", type = "l")
points(household_power_consumption$DateTime, household_power_consumption$Sub_metering_2, col = "red", type = "l")
points(household_power_consumption$DateTime, household_power_consumption$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()