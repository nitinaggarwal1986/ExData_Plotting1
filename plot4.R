
## Reading the data from the file "household_power_consumption.txt" mentioning
## the separator as ";"
hpc.data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
head(hpc.data)

## I use the paste command to attach the date with time and the use the  
## as.POSIXlt to convert the converted time to the POSIXlt format with the
## right date and time.
hpc.data$time<-paste(hpc.data$Date,hpc.data$Time,sep=" ")
hpc.data$time<-as.POSIXlt(hpc.data$time,format = "%d/%m/%Y %H:%M:%S") 

## Converting the class for the date and time in the Date and time format
hpc.data$Date<-as.Date(as.character(hpc.data$Date), "%d/%m/%Y")

## Subsetting the whole data to the dates 2007-02-01 and 2007-02-02.
hpc.data<-subset(hpc.data, hpc.data$Date==as.Date("2007-02-01")|hpc.data$Date==as.Date("2007-02-02"))

## Converting the columns Sub metering 1-3 into numeric class.
hpc.data$Sub_metering_1<-as.numeric(as.character(hpc.data$Sub_metering_1))
hpc.data$Sub_metering_2<-as.numeric(as.character(hpc.data$Sub_metering_2))
hpc.data$Sub_metering_3<-as.numeric(as.character(hpc.data$Sub_metering_3))

## Converting the column Global active power, Global reactive power and Voltage
## from factor class to to numeric class.
hpc.data$Global_active_power<-as.numeric(as.character(hpc.data$Global_active_power))
hpc.data$Global_reactive_power<-as.numeric(as.character(hpc.data$Global_reactive_power))
hpc.data$Voltage<-as.numeric(as.character(hpc.data$Voltage))


head(hpc.data)

## Opening the graphic device for PNG format with file name plot4.png.
png(filename = "plot4.png", width = 480, height = 480, units = "px")
## Plotting the required plot in the file plot4.png.

## Setting the rows and columns for the plot
par(mfrow=c(2,2))

plot(hpc.data$time, hpc.data$Global_active_power,ylab="Global Active Power", 
     type="l", xlab="")

plot(hpc.data$time, hpc.data$Voltage,ylab="Voltage", 
     type="l", xlab="datetime")


plot(hpc.data$time, hpc.data$Sub_metering_1,ylab="Energy sub metering", 
     type="l", xlab="", col="Black")
lines(hpc.data$time, hpc.data$Sub_metering_2, col="red")
lines(hpc.data$time, hpc.data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2, yjust=0, y.intersp=.8, bty="n",col=c("Black", "red","blue"))


plot(hpc.data$time, hpc.data$Global_reactive_power,ylab="Global_reactive_power", 
     type="l", xlab="datetime")

dev.off()
# The plot 1 is now stored in the working directory with name "plot4.png"

