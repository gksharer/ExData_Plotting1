x <-read.csv2("household_power_consumption.txt")
x[x=="?"] <- NA
x <- droplevels(x)
x$Date <- as.Date(strptime(x$Date,format="%d/%m/%Y",tz="GMT"))
x <- subset(x,x$Date=="2007-02-01" | x$Date=="2007-02-02")
x[,3:9] <- lapply(x[3:9],function(x) as.numeric(as.character(x)))
png(filename="plot1.png")
hist(x$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
