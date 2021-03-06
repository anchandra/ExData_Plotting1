# Creating line chart to examine how household energy usage varies over a 2-day period in February, 2007

# Read data from the dates 2007-02-01 and 2007-02-02
colNames <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-metering 1", "Sub-metering 2", "Sub-metering 3")
dat <- read.table("household_power_consumption.txt",sep=";",col.names=colNames,na.strings="?",header=TRUE,stringsAsFactors=FALSE)
dat<- subset(dat, (dat$Date == "1/2/2007" | dat$Date== "2/2/2007"))
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Plotting line chart and saving as a png file
png(file="plot2.png", height=480, width=480, bg="transparent")
plot(dat$DateTime, dat$Global.Active.Power,type="l",ylab="Global Active Power",xlab="")
dev.off()