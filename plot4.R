##READS THE DATA AND SELECTS REQUIRED STUFF
data<-read.table('household_power_consumption.txt',sep = ";",header=TRUE)
st <- "1/2/2007"
en <- "2/2/2007"
#Only select the two days
selecteddata<-data[(data$Date == st | data$Date == en),]
#Convert date & time to make it useable for plotting
dates<- strptime(paste(selecteddata$Date,selecteddata$Time), "%d/%m/%Y %H:%M:%S");

#plots a lot of stuff in a multi-panel plot
png(file = "plot4.png")  
par(mfrow=c(2,2))
#left top panel
plot(dates,as.numeric(selecteddata$Global_active_power)/1000.0, 
     ylab="Global Active Power (kilowatts)",xlab="",pch=".",lty=1,lwd=2,type='n')
lines(dates,as.numeric(selecteddata$Global_active_power)/1000.0)

#right top panel
plot(dates,as.numeric(selecteddata$Voltage), 
     ylab="Voltage",xlab="datetime",pch=".",lty=1,lwd=2,type='n')
lines(dates,as.numeric(selecteddata$Voltage))

#left bottom panel
plot(dates,as.numeric(selecteddata$Sub_metering_1), ylab="Energy sub-metering",
     xlab="",pch="|",lty=1,lwd=2,type="n")
lines(dates,as.numeric(selecteddata$Sub_metering_1),col=1)
lines(dates,as.numeric(selecteddata$Sub_metering_2),col=2)
lines(dates,as.numeric(selecteddata$Sub_metering_3),col=4)
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty=c(1,1,1),        
       col=c(1,2,4))
#right bottom panel
plot(dates,as.numeric(selecteddata$Global_reactive_power), 
     ylab="Global Reactive Power",xlab="datetime",pch=".",lty=1,lwd=2,type='n')
lines(dates,as.numeric(selecteddata$Global_reactive_power))
dev.off()
