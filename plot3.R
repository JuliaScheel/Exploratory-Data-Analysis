## exploratory data analysis week 1
#plot 3


data_path <- "./exdata-data-household_power_consumption/household_power_consumption.txt" #file path
data <- read.table(data_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")     #read in file
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]                               #get the data of interest

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdata$Global_active_power)
subMetering1 <- as.numeric(subdata$Sub_metering_1)                                       #get submetering data 
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

png("plot3.png", width=480, height=480)                                                  #make png file and set size
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()