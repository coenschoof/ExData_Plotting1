household_power_consumption <- read.csv("./household_power_consumption.txt", row.names=NULL, sep=";")

Sys.setlocale("LC_ALL","English")
target <- c("1/2/2007", "2/2/2007")
household_power_consumption <- household_power_consumption %>% filter(Date %in% target)

household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")

plot(household_power_consumption$DateTime, as.numeric(household_power_consumption$Global_active_power), 
               ylab = "Global Active Power (kilowatts)",
                xlab = " ",
               type = "l")
               

dev.off()