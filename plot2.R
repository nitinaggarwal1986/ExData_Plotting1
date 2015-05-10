
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

## Converting the column Global active power into numeric class.
hpc.data$Global_active_power<-as.numeric(as.character(hpc.data$Global_active_power))
head(hpc.data)

## Opening the graphic device for PNG format with file name plot2.png.
png(filename = "plot2.png", width = 480, height = 480, units = "px")
## Plotting the required plot in the file plot2.png.
plot(hpc.data$time, hpc.data$Global_active_power,ylab="Global Active Power (killowatts)", 
     type="l", xlab="")

dev.off()
# The plot 1 is now stored in the working directory with name "plot2.png"