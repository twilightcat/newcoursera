##READS THE DATA AND SELECTS REQUIRED STUFF
data<-read.table('household_power_consumption.txt',sep = ";",header=TRUE)
st <- "1/2/2007"
en <- "2/2/2007"
#Only select the two days
selecteddata<-data[(data$Date == st | data$Date == en),]
#Convert date & time to make it useable for plotting
dates<- strptime(paste(selecteddata$Date,selecteddata$Time), "%d/%m/%Y %H:%M:%S");

#plots the global active power with time
png(file = "plot2.png")  
plot(dates,as.numeric(selecteddata$Global_active_power)/1000.0, 
     ylab="Global Active Power (kilowatts)",xlab="",pch=".",lty=1,lwd=2,type='n')
lines(dates,as.numeric(selecteddata$Global_active_power)/1000.0)
dev.off()