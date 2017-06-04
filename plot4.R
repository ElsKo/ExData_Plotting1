# Module Exploratory Data Analysis, week 1
# Course Project 1
# Plot 4


#set the working directory
setwd("C:/Users/Els/Documents/Coursera Data Science/M04 Exploratory Data Analysis/W1/Assignment")

#Import the dataset
data<-read.table("household_power_consumption.txt"
                 ,header = TRUE
                 ,sep = ";" 
                 ,na.strings = "?")

#Subset dataset, only data from the dates 2007-02-01 and 2007-02-02
datasubset<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#convert date and time to date/time variables
datasubset$DateConverted<-strptime(datasubset$Date, "%e/%m/%Y")
datasubset$DateConvertedAsData<-as.Date(datasubset$DateConverted)
datasubset$DateTime<-as.POSIXct(paste (datasubset$Date, datasubset$Time), format="%e/%m/%Y %H:%M:%S")

#plot4
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#4.1
plot(datasubset$Global_active_power ~ datasubset$DateTime
     , type="l"
     , xlab = ""
     , ylab = "Global Active Power")

#4.2
plot(datasubset$Voltage ~ datasubset$DateTime
     , type="l"
     , xlab = "datetime"
     , ylab = "Voltage")

#4.3
plot(datasubset$Sub_metering_1 ~ datasubset$DateTime
     , type = "l"
     ,col = "black"
     , xlab = ""
     , ylab = "Energy sub metering")
lines(datasubset$Sub_metering_2 ~ datasubset$DateTime
      ,col = "red")
lines(datasubset$Sub_metering_3 ~ datasubset$DateTime
      ,col = "blue")
legend("topright"
       , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=1
       , lwd=1
       , bty = "n"
       , col=c("black", "red", "blue"))

#4.4
plot(datasubset$Global_reactive_power ~ datasubset$DateTime
     , type="l"
     , xlab = "datetime"
     , ylab = "Global_reactive_power")

dev.off()

