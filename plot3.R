myplot3<-function(x)  {
mydata = read.table("household_power_consumption.txt",sep=";", header=TRUE, fill=FALSE, strip.white=TRUE,na.string="?")
## read in data

mydata$Date<-as.Date(mydata$Date,format="%d/%m/%Y") ## get 1st column into date format
p<-mydata[mydata$Date==(as.Date("2007-02-01",format="%Y-%m-%d"))|mydata$Date==(as.Date("2007-02-02",format="%Y-%m-%d")),] ## subset between correct dates
f<-paste(as.character(p$Date),as.character(p$Time)) ##concatenate date and time strings

f<-as.POSIXct(f) ## put in correct date format
p$Time<-f ## I realise this is less efficient, but done as two step process to help debug

with(p,{
  plot(x=Time,y=Sub_metering_1,type="l",xlab="",ylab="",cex.axis=0.7) ## plot basic data
  
  mtext("Energy sub metering", side=2, line=3,cex=0.7) ## y axis title
  lines(x=Time,y=Sub_metering_2,type="l",col="red") ## add 2nd line to plot
  
  lines(x=Time,y=Sub_metering_3,type="l",col="blue") ## add 3rd line to plot
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5,2.5),col=c("black","blue","red"),cex=0.5) 
  }) ## add legend of correct size and position
dev.copy(png,file="plot3.png",width=480,height=480) ## send to png image file
dev.off()
}