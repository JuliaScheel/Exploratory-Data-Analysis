## exploratory data analysis week 1
#plot 2


data_path <- "./exdata-data-household_power_consumption/household_power_consumption.txt" #file path
data <- read.table(data_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")     #read in file
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]                               #get the data of interest

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")    #get dates for plot
globalActivePower <- as.numeric(subdata$Global_active_power)                             #see plot 1
png("plot2.png", width=480, height=480)                                                  #set size of the plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") #plot + axis + labels
dev.off()