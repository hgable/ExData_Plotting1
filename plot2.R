##Load data into R

getwd()
setwd("C:/Users/hagable/Documents/Training/Data Science Coursera")

powerdata<-data.table::fread("household_power_consumption.txt", na.strings="?")

#subset to desired dates
subset <-rbind(powerdata[powerdata$Date=="1/2/2007",],powerdata[powerdata$Date=="2/2/2007",])

#convert to date and time formats
powerdata$Date <- as.Date(powerdata$Date, format= "%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")

#graph 2
subset$datetime <- with(subset, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
plot(subset$datetime, subset$globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off() 

