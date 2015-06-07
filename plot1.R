##READS THE DATA AND SELECTS REQUIRED STUFF
data<-read.table('household_power_consumption.txt',sep = ";",header=TRUE)
st <- "1/2/2007"
en <- "2/2/2007"
#Only select the two days
selecteddata<-data[(data$Date == st | data$Date == en),]
#Convert date & time to make it useable for plotting
dates<- strptime(paste(selecteddata$Date,selecteddata$Time), "%d/%m/%Y %H:%M:%S");

#make histogram plot
png(file = "plot1.png")  
hist(as.numeric(selecteddata$Global_active_power)/1000.0,col='red',breaks=seq(0,6,by=0.25),
     main="Global Active Power", xlab="Global Active Power (kilowatts)",ylim=c(0, 1200))
dev.off()