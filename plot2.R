library(lubridate)

dataset <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

a <- dmy("01/02/2007")
a <- as.numeric(a)

b <- dmy("02/02/2007")
b <- as.numeric(b)

f <- ((as.numeric(dmy(dataset$Date) == a)) | (as.numeric(dmy(dataset$Date)) == b))

dataset <- subset(dataset, f)

date_time <- dmy_hms(paste(dataset$Date, dataset$Time))

dataset <- cbind(date_time,dataset)

png(filename = "plot2.png",  width = 480, height = 480)

plot(x = dataset$date_time, y = dataset$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
