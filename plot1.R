##Load data into R

getwd()
setwd("C:/Users/hagable/Documents/Training/Data Science Coursera")

powerdata<-data.table::fread("household_power_consumption.txt", na.strings="?")
powerdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

subSetData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

##Histogram Global Active Power Plot 1

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()


            