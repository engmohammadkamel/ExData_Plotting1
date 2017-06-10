library(data.table)
library(lubridate)

##reading the data
myData<-fread("household_power_consumption.txt",na.strings = "?")[Date=="1/2/2007" | Date == "2/2/2007",]

##dsate time column
myData[,datetime:= dmy_hms(paste(Date,Time,sep = " "))]

##the graph
png("plot4.png",width = 480,height = 480,units = "px")
par(mfcol=c(2,2))

# Plot 1
plot(myData$datetime,myData$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "")

#plot 2
plot(myData$datetime,myData$Sub_metering_1,type = "l",ylab = "Energy Sub Metering",xlab = "")
lines(myData$datetime,myData$Sub_metering_2,col = "red")
lines(myData$datetime,myData$Sub_metering_3,col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1,bty="n",cex=0.9)

#Plot 3
plot(myData$datetime,myData$Voltage,type = "l",ylab = "Voltage",xlab = "DateTime")

#plot 4
plot(myData$datetime,myData$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "DateTime")
dev.off()
