fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileurl,destfile = "./exdata_data_household_power_consumption.zip",method = "curl")

unzip("exdata_data_household_power_consumption.zip")

rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

rawdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"), ]

hist(rawdata[, 3], col = "red", main = "Global Active Power", 
     +      xlab = "Global Active Power (kilowatts)")
