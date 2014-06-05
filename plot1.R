setwd("C:/Users/Elisheva/Desktop/coursera/data science/exploratory analysis")
data<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=4000,
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power",
                             "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                             "Sub_metering_3"))
hpc<-data[data[,1]!="3/2/2007",]
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

#plot1
png(filename="plot1.png")
hist(hpc[,3],col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()