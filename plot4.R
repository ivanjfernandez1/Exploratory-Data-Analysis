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

##Fourth problem contains 4 charts, then set mfrow=c(2,2)...mfcol would yield same result
par(mfrow = c(2,2))

#We plot four different charts in one device

#First plot (top left)
plot(partial_data$Global_active_power~partial_data$Datetime,xlab="",ylab = "Global Active Power (kilowatts)", type =  "l")
#Second plot (top right)
plot(partial_data$Voltage~partial_data$Datetime,type = "l", xlab="datetime", ylab="Voltage")
#Thrid plot (bottom left)
plot(partial_data$Sub_metering_1~partial_data$Datetime,type = "l",col= "black", xlab="",ylab = "Energy sub metering")
lines(partial_data$Sub_metering_2~partial_data$Datetime,type = "l", col="red")
lines(partial_data$Sub_metering_3~partial_data$Datetime,type = "l",col = "blue")
#Last plot (bottom right)
plot(partial_data$Global_reactive_power~partial_data$Datetime,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(device = png,file= "plot4.png",height=480, width=480)
dev.off()
