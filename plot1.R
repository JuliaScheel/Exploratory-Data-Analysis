## exploratory data analysis week 1
#plot 1


data_path <- "./exdata-data-household_power_consumption/household_power_consumption.txt" #file path
data <- read.table(data_path, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")     #read in file
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]                               #get the data of interest


globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)                                                 #set size of the plot
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")  #make histogram + axis + labels
dev.off()