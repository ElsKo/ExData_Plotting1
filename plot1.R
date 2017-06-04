# Module Exploratory Data Analysis, week 1
# Course Project 1
# Plot 1


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

#plot1
png(file="plot1.png",width=480,height=480)
hist(datasubset$Global_active_power
     ,main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)"
     ,ylab = "Frequency"
     ,col = "red")
dev.off()