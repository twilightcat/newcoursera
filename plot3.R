##READS THE DATA AND SELECTS REQUIRED STUFF
data<-read.table('household_power_consumption.txt',sep = ";",header=TRUE)
st <- "1/2/2007"
en <- "2/2/2007"
#Only select the two days
selecteddata<-data[(data$Date == st | data$Date == en),]
#Convert date & time to make it useable for plotting
dates<- strptime(paste(selecteddata$Date,selecteddata$Time), "%d/%m/%Y %H:%M:%S");

#plots the different energy sub-meterings with time
png(file = "plot3.png")  
plot(dates,as.numeric(selecteddata$Sub_metering_1), ylab="Energy sub-metering",
     xlab="",pch="|",lty=1,lwd=2,type="n")
lines(dates,as.numeric(selecteddata$Sub_metering_1),col=1)
lines(dates,as.numeric(selecteddata$Sub_metering_2),col=2)
lines(dates,as.numeric(selecteddata$Sub_metering_3),col=4)
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty=c(1,1,1),        
       col=c(1,2,4))
dev.off()