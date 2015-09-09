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

##Use plot to graph "global active..." on the y-axis and day of the week "Datetime" on the x-axis
plot(partial_data$Global_active_power~partial_data$Datetime,xlab="",ylab = "Global Active Power (kilowatts)", type =  "l")
dev.copy(device = png,file= "plot2.png",height=480, width=480)
dev.off()
