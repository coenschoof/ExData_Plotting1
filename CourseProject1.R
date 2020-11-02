household_power_consumption <- read.csv("./household_power_consumption.txt", row.names=NULL, sep=";")


target <- c("1/2/2007", "2/2/2007")
household_power_consumption <- household_power_consumption %>% filter(Date %in% target) %>% mutate(Date = lubridate::dmy(Date)) %>% mutate(Time = lubridate::hms(Time))


png(filename = "plot1.png")
#par(mar = c(4,4,2,2))
myHist <- hist(as.numeric(household_power_consumption$Global_active_power), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylim = c(0, 1200))

dev.off()