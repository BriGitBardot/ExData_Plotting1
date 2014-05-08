## This script takes data from the 'Electric power consumption' dataset.
## From a subset of the dates 2007-02-01 and 2007-02-02 it produces a histogram showing
## the fequencies of the Global Active Power (from 0 to 6 kilowatts).
## To properly reproduce plot1.png (also contained this github repository) it is assumed that 
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

## Create file plot1.png
png("plot1.png", height=480, width=480, bg= 'transparent')

## Build histogram
hist(myData$Global_active_power, col='red',xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

## Close device
dev.off()