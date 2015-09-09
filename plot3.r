## Set directory to file
setwd("C:/Users/ivan/Desktop/datasciencecoursera/Exploratory")

## Assign full data file to "raw_data"
raw_data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

## Modify date format to Date/Time as instructed
raw_data$Date <- as.Date(x=raw_data$Date, format = "%d/%m/%Y")

## Create subset of data between dates 2007-02-01 and 2007-02-02 and name data "partial_data"
partial_data <- subset(raw_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(partial_data$Date), partial_data$Time)
partial_data$Datetime <- as.POSIXct(datetime)
##################################### Data set and ready. Start ploting 

##First plot contains only one chart, then set mfrow=c(1,1)...mfcol would yield same result
par(mfrow = c(1,1))

## Use plot all three "sub_metering_*" with "Energy sub metering" in the y-axis and "Datetime" on the x-axis
##each line with the following colors: 1-black, 2-red and 3-blue

##plot and first series
plot(partial_data$Sub_metering_1~partial_data$Datetime,type = "l",col= "black", xlab="",ylab = "Energy sub metering")
#second series
lines(partial_data$Sub_metering_2~partial_data$Datetime,type = "l", col="red")
##thrid series
lines(partial_data$Sub_metering_3~partial_data$Datetime,type = "l",col = "blue")

##add legend to the top right of the chart using the same color combo
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=1)
dev.copy(device = png,file= "plot3.png",height=480, width=480)
dev.off()
