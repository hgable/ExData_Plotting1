##Load data into R

getwd()
setwd("C:/Users/hagable/Documents/Training/Data Science Coursera")
powerdata<-data.table::fread("household_power_consumption.txt", na.strings="?")
powerdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
subset <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot 3 

subset$datetime <- with(subset, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


subset$globalActivePower <- as.numeric(subset$Global_active_power)

subset$subMetering1 <- as.numeric(subset$Sub_metering_1)
subset$subMetering2 <- as.numeric(subset$Sub_metering_2)
subset$subMetering3 <- as.numeric(subset$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(subset$datetime, subset$subMetering1, type="l", ylab="Energy sub metering",xlab="")
lines(subset$datetime, subset$subMetering2, type="l", col="red")
lines(subset$datetime, subset$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()