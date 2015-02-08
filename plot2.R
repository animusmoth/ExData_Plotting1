
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
with(sub,plot(x$datetime, x$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png")
dev.off()



