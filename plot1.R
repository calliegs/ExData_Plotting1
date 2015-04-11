myplot1<-function(x)  {
mydata = read.table("household_power_consumption.txt",sep=";", header=TRUE, fill=FALSE, strip.white=TRUE,na.string="?")
## read in data

mydata$Date<-as.Date(mydata$Date,format="%d/%m/%Y") ## get correct date format for column 1
p<-mydata[mydata$Date==(as.Date("2007-02-01",format="%Y-%m-%d"))|mydata$Date==(as.Date("2007-02-02",format="%Y-%m-%d")),] ##subset required dates
f<-paste(as.character(p$Date),as.character(p$Time)) ## concatenate date and time strings
f<-strptime(f,format="%d/%m/%Y %H:%M:%S") ## get in correct date format for column 2
p$Time<-f ## I realise this is less efficient, but done as two step process to help debug
hist(p$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",yaxt="n") ##histogram call
v2=c("0","200","400","600","800","1000","1200") ## labels for y axis
v1=c(0,200,400,600,800,1000,1200) ## tick marks for y axis
axis(side = 2, at = v1, labels = v2,cex.axis=0.7) ## setting up y axis

dev.copy(png,file="plot1.png",width=480,height=480) ## send to png image file
dev.off()
}