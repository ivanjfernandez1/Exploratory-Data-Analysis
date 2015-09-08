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

## Plot 1 looks like a histrogram with red bars, and x-axis:"Global Active Power (kilowatts"
## no need to label y-axis as histogram auto picks frequency
## use function from basic package hist() and plot Global Active power in data using col=red and main=Global Active Power (kilowatts)
hist(x = partial_data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power" )

## dave to png file using dev.copy and passing pixels 480 x 480 (height and width). Close device at the end
dev.copy(device = png,file= "plot1.png",height=480, width=480)
dev.off()
