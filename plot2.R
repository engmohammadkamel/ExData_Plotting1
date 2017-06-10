library(data.table)
library(lubridate)

##reading the data
myData<-fread("household_power_consumption.txt",na.strings = "?")[Date=="1/2/2007" | Date == "2/2/2007",]

##dsate time column
myData[,datetime:= dmy_hms(paste(Date,Time,sep = " "))]


##the graph
png("plot2.png",width = 480,height = 480,units = "px")
plot(myData$datetime,myData$Global_active_power,type = "l",ylab = "Global Active Power(Kilowatts)",xlab = "")
dev.off()