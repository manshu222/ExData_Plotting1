library(dplyr)
library(lubridate)

data = read.csv2("household_power_consumption.txt")

data = filter(data, "1/2/2007" == Date | Date == "2/2/2007")
data$date_time = dmy_hms(paste(data$Date, data$Time))

for(num in 3:9){
    data[,num] = as.numeric(data[,num])
}

plot(data$date_time, data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()
