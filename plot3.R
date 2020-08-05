library(dplyr)
library(lubridate)

data = read.csv2("household_power_consumption.txt")

data = filter(data, "1/2/2007" == Date | Date == "2/2/2007")
data$date_time = dmy_hms(paste(data$Date, data$Time))

for(num in 3:9){
    data[,num] = as.numeric(data[,num])
}


with(data, plot(date_time, Sub_metering_1, type='l', col='black', xlab="",ylab="Energy sub metering"))
with(data, lines(date_time, Sub_metering_2, col='red'))
with(data, lines(date_time, Sub_metering_3, col='blue'))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", 'red', 'blue'), lty=c(1,1,1), cex=0.75)

dev.copy(png, "plot3.png")
dev.off()
