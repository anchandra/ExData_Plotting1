# Creating 4 chart to examine how household energy usage varies over a 2-day period in February, 2007

# Read data from the dates 2007-02-01 and 2007-02-02
colNames <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-metering 1", "Sub-metering 2", "Sub-metering 3")
dat <- read.table("household_power_consumption.txt",          sep=";",col.names=colNames,na.strings="?",header=TRUE,stringsAsFactors=FALSE)
dat<- subset(dat, (dat$Date == "1/2/2007" | dat$Date== "2/2/2007"))
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Plotting 4 charts and saving in a png file
png(file="plot4.png", height=480, width=480, bg="transparent")
par(mfrow=c(2,2))
plot(dat$DateTime, dat$Global.Active.Power,
     type="l",
     ylab="Global Active Power",
     xlab="")
plot(dat$DateTime, dat$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")
plot(dat$DateTime, dat$Sub.metering.1,
     type="l",ylab="Energy sub metering",xlab="")
lines(dat$DateTime, dat$Sub.metering.2,col="red")
lines(dat$DateTime, dat$Sub.metering.3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black", "red", "blue"))
dev.off()