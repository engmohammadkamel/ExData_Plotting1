
library(data.table)

##reading the data
myData<-fread("household_power_consumption.txt",na.strings = "?")[Date=="1/2/2007" | Date == "2/2/2007",]

##histogram
png("plot1.png",width = 480,height = 480,units = "px")
hist(myData$Global_active_power, col="red",main="",xlab = "Global Active Power(Kilowatts)")
title(main="Global Active Power")
dev.off()
