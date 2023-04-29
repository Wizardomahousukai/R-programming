fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileurl,destfile = "./exdata_data_household_power_consumption.zip",method = "curl")

unzip("exdata_data_household_power_consumption.zip")

rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

rawdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"), ]

dateindmy <- as.Date(rawdata[, 1], format = "%d/%m/%Y")
timeinHMS <- strptime(rawdata[, 2], format = "%H:%M:%S")
Clocktime <- as.POSIXct(paste(dateindmy, rawdata[, 2]))

par(mfrow = c(2,2))

plot(Clocktime, rawdata[, 7], ylab = "Energy sub metering", type = "l")
lines(Clocktime, rawdata[, 8], col = "red")
lines(Clocktime, rawdata[, 9], col = "blue")

plot(Clocktime, rawdata[, 3], ylab = "Energy sub metering", type = "l")
plot(Clocktime, rawdata[, 4], ylab = "Energy sub metering", type = "l")
plot(Clocktime, rawdata[, 5], ylab = "Energy sub metering", type = "l")