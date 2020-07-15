library(lubridate)

dataset <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

a <- dmy("01/02/2007")
a <- as.numeric(a)

b <- dmy("02/02/2007")
b <- as.numeric(b)

f <- ((as.numeric(dmy(dataset$Date) == a)) | (as.numeric(dmy(dataset$Date)) == b))

dataset <- subset(dataset, f)

png(filename = "plot1.png",  width = 480, height = 480)

hist(
    dataset$Global_active_power,col = "red", 
    xlab = "Global Active Power (kilowatts)", 
    xlim = c(0,6) ,ylim = c(0,1200),breaks = 15,
    main = "Global Active Power")

dev.off()