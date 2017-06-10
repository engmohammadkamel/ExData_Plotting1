library(data.table)
library(lubridate)

##reading the data
myData<-fread("household_power_consumption.txt",na.strings = "?")[Date=="1/2/2007" | Date == "2/2/2007",]

##dsate time column
myData[,datetime:= dmy_hms(paste(Date,Time,sep = " "))]

##the graph
png("plot3.png",width = 480,height = 480,units = "px")
plot(myData$datetime,myData$Sub_metering_1,type = "l",ylab = "Energy Sub Metering",xlab = "")
lines(myData$datetime,myData$Sub_metering_2,col = "red")
lines(myData$datetime,myData$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)
dev.off()