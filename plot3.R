# plot3.R reads data from the  "Individual household electric power consumption Data Set"
# from the UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/)
# and creates a plot of energy sub metering vs. time
# png() defaults to 480x480 px

# uncomment the next line if the dataset has not already been downloaded to local
#download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
x <-read.csv2(unz("household_power_consumption.zip","household_power_consumption.txt"))
x[x=="?"] <- NA
x <- droplevels(x)
x$Date <- as.Date(strptime(x$Date,format="%d/%m/%Y",tz="GMT"))
x <- subset(x,x$Date=="2007-02-01" | x$Date=="2007-02-02")
x[,3:9] <- lapply(x[3:9],function(x) as.numeric(as.character(x)))
x$DateTime <- paste(x$Date,x$Time)
x$DateTime <- as.POSIXct(x$DateTime)
png(filename="plot3.png")
with(x,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(x,lines(DateTime,Sub_metering_2,col="red"))
with(x,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
