## This script takes data from the 'Electric power consumption' dataset.
## From a subset of the dates 2007-02-01 and 2007-02-02 it produces a plot showing
## the variation of the three different energy sub metering variables (1: measured in the kitchen, 
## 2: measured in the laundry room, 3: measurement of the electric
## water-heater and air conditioner) across the two days.
## To properly reproduce plot3.png (also contained this github repository) it is assumed that 
## the file household_power_consumption.txt has already been downloaded sucessfully and is stored 
## in your current working directory.


## Setting local time aspects of the system to default ("C" for North-American standard) 
## for reproducibility purposes 
Sys.setlocale("LC_TIME", "C")

## Reading in the data, using the code snippet Syed Tariq kindly provided in this 
## Coursera Forum Thread: https://class.coursera.org/exdata-002/forum/thread?thread_id=47
## Note: Community TA Earl F Glynn explicitly states in this same thread that this is not cheating!
require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

##Joining date and time columns into one column with propper format
myData$DateTime <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")

## Create file plot3.png
png("plot3.png", height=480, width=480, bg= 'transparent')

## Plot lines
plot(myData$DateTime, myData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(myData$DateTime, myData$Sub_metering_2, type="l", col="red")
lines(myData$DateTime, myData$Sub_metering_3, type="l", col="blue")

## Adding legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "blue","red")) # gives the legend lines the correct color and width


## Close device
dev.off()