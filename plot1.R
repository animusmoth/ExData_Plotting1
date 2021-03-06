
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
with(sub,hist(sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.copy(png, file="plot1.png")
dev.off()