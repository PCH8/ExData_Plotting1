#read data into R
powerdata = read.table("household_power_consumption.txt", sep=";" ,header = TRUE,na.strings = "?", stringsAsFactors = FALSE)

#filter data for the given date range
powerfilter <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

#set PNG as the active graphics device for the plot
dev.set(3)

#create a png type file in the working directory
png(filename = "Plot1.png",  width = 480, height = 480)

#drawing the plot and saviing in png
hist(powerfilter$Global_active_power, col ="red", xlab = "Global Active Power(kilowatts)", main= "Global Active Power")

#closing the active device to print plot to png
dev.off()