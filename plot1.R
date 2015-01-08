# Creating histogram to examine how household energy usage varies over a 2-day period in February, 2007

# Read data from the dates 2007-02-01 and 2007-02-02
colNames <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-metering 1", "Sub-metering 2", "Sub-metering 3")
dat <- read.table("household_power_consumption.txt",sep=";",col.names=colNames,na.strings="?",header=TRUE,stringsAsFactors=FALSE)
dat<- subset(dat, (dat$Date == "1/2/2007" | dat$Date== "2/2/2007"))
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Plotting the histogram and saving as a png file
png(file="plot1.png", height=480, width=480, bg="transparent")
hist(dat$Global.Active.Power,col="orange",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()