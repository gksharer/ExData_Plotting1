# plot1.R reads data from the  "Individual household electric power consumption Data Set"
# from the UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/)
# and creates a histogram of global active power 

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
x <-read.csv2(unz("household_power_consumption.zip","household_power_consumption.txt"))
x[x=="?"] <- NA
x <- droplevels(x)
x$Date <- as.Date(strptime(x$Date,format="%d/%m/%Y",tz="GMT"))
x <- subset(x,x$Date=="2007-02-01" | x$Date=="2007-02-02")
x[,3:9] <- lapply(x[3:9],function(x) as.numeric(as.character(x)))
png(filename="plot1.png")
hist(x$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
