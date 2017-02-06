#read data into R
powerdata = read.table("household_power_consumption.txt", sep=";" ,header = TRUE,na.strings = "?", stringsAsFactors = FALSE)

#filter data for the given date range
powerfilter <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

#type cast date and time fields
powerfilter$Date <- as.Date(powerfilter$Date, format="%d/%m/%Y")
powerfilter$Time <- strptime(powerfilter$Time, format="%H:%M:%S")

#formatting the Time field
table(powerfilter$Date)
powerfilter[1:1440,"Time"] <- format(powerfilter[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerfilter[1441:2880,"Time"] <- format(powerfilter[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#set PNG as the active graphics device for the plot
dev.set(3)

#create a png type file in the working directory
png(filename = "Plot3.png",  width = 480, height = 480)

#drawing the plot and saviing in png
plot(powerfilter$Time,type ="n", powerfilter$Sub_metering_1, xlab = "", ylab = "Energy sub metering")
lines(powerfilter$Time, powerfilter$Sub_metering_1, col = "black")
lines(powerfilter$Time, powerfilter$Sub_metering_2, col = "red")
lines(powerfilter$Time, powerfilter$Sub_metering_3, col = "blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#closing the active device to print plot to png
dev.off()