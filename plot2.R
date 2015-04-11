myplot2<-function(x)  {
mydata = read.table("household_power_consumption.txt",sep=";", header=TRUE, fill=FALSE, strip.white=TRUE,na.string="?")
## read in data

mydata$Date<-as.Date(mydata$Date,format="%d/%m/%Y") ## get column 1 in correct date format
p<-mydata[mydata$Date==(as.Date("2007-02-01",format="%Y-%m-%d"))|mydata$Date==(as.Date("2007-02-02",format="%Y-%m-%d")),] ## subset relevant dates
f<-paste(as.character(p$Date),as.character(p$Time)) ## concatenate date and time strings 

f<-as.POSIXct(f) ##sort date format
p$Time<-f ## I realise this is less efficient, but done as two step process to help debug
plot(x=p$Time,y=p$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png",width=480,height=480) ## send to png image file
dev.off()
}