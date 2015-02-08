
fileName = "./datafile.zip"
if (!file.exists(fileName)) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = fileName, method="curl")
}

# unzip the file
unzip("datafile.zip")
# Load the file
fl  <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# subset for Date
sub  <- fl[fl$Date=="1/2/2007"|fl$Date=="2/2/2007",]
# remove original
rm(fl)
# convert to Double
sub$Global_active_power <- as.double(sub$Global_active_power)
sub$datetime <- strptime(paste(sub$Date," ",sub$Time), "%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
plot(x$datetime, x$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(x$datetime, x$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "")
lines(x$datetime,x$Sub_metering_2, type="l",col="red")
lines(x$datetime,x$Sub_metering_3, type="l",col="blue")
lbls <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
lncol <- c("black","red","blue")
legend("topright", legend=lbls, col=lncol, lty="solid")
plot(x$datetime, x$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(x$datetime, x$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.copy(png, file="plot4.png")
dev.off()



