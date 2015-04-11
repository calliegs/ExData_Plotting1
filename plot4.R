myplot4<-function(x)  {
mydata = read.table("household_power_consumption.txt",sep=";", header=TRUE, fill=FALSE, strip.white=TRUE,na.string="?")
## read in data

mydata$Date<-as.Date(mydata$Date,format="%d/%m/%Y") ## convert first column to date format
p<-mydata[mydata$Date==(as.Date("2007-02-01",format="%Y-%m-%d"))|mydata$Date==(as.Date("2007-02-02",format="%Y-%m-%d")),]
## subset between required dates
f<-paste(as.character(p$Date),as.character(p$Time))
## concatenate date and time strings 
f<-as.POSIXct(f) ## put into required date format
p$Time<-f ## I realise this is less efficient, but done as two step process to help debug
par(mfrow=c(2,2)) ## make plots 2 rows and 2 columns
with(p,{
  plot(x=Time,y=Global_active_power,type="l",xlab="",ylab="",cex.axis=0.5) ## top left plot
  mtext("Global Active Power", side=2, line=3,cex=0.7) ## get y axis title right size
  plot(x=Time,y=Voltage,type="l",xlab="",ylab="",cex.axis=0.5) ## top right plot
  mtext("Voltage", side=2, line=3,cex=0.7) ## get y axis format correct
  mtext("datetime", side=1, line=3,cex=0.7) ## get x axis format correct
  plot(x=Time,y=Sub_metering_1,type="l",xlab="",ylab="",cex.axis=0.5) ## bottom left basic plot
  mtext("Energy sub metering", side=2, line=3,cex=0.7) ## add y axis text
  lines(x=Time,y=Sub_metering_2,type="l",col="red") ## add next line to plot
  lines(x=Time,y=Sub_metering_3,type="l",col="blue") ## add 3rd line to plot
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5,2.5),col=c("black","blue","red"),cex=0.2) 
  ## add legend and put in right place
  plot(x=Time,y=Global_reactive_power,type="l",xlab="",ylab="",cex.axis=0.5) ## bottom right plot
  mtext("Global_reactive_power", side=2, line=3,cex=0.7) ## yaxis title
  mtext("datetime", side=1, line=3,cex=0.7) ## x axis title
  })
dev.copy(png,file="plot4.png",width=480,height=480) ## send to png image file
dev.off()
}