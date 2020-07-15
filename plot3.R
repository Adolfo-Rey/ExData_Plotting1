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

png(filename = "plot3.png",  width = 480, height = 480)

with(dataset, plot(date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
points(dataset$date_time, dataset$Sub_metering_2, type = "l", xlab = "", ylab = "", col="blue")
points(dataset$date_time, dataset$Sub_metering_3, type = "l", xlab = "", ylab = "", col="red")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()