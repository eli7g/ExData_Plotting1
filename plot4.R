setwd("C:/Users/Elisheva/Desktop/coursera/data science/exploratory analysis")
data<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=4000,
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                             "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                             "Sub_metering_3"))
hpc<-data[data[,1]!="3/2/2007",]
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")
par(mfrow=c(2,2))
plot(x=hpc$DateTime,y=hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(x=hpc$DateTime,y=hpc$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(x=hpc$DateTime,y=hpc$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
points(x=hpc$DateTime,y=hpc$Sub_metering_2,type="l",col="red")
points(x=hpc$DateTime,y=hpc$Sub_metering_3,type="l",col="blue")
plot(x=hpc$DateTime,y=hpc$Global_reactive_power,type="l",ylab="Global_reactiv_power",xlab="datetime")
dev.off()