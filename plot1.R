library(dplyr)
library(lubridate)

data = read.csv2("household_power_consumption.txt")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = filter(data, as.Date("2007-02-01") == Date |Date == as.Date("2007-02-02"))
data$Time = hms(data2$Time)

for(num in 3:9){
    data[,num] = as.numeric(data[,num])
}

hist(data$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()