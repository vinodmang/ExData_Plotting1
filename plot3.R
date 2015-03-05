hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_s<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_s$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")
plot(hpc_s$DateTime,hpc_s$Sub_metering_1,col="black",type="l",ylab="Energy Sub Metering",xlab="")
lines(hpc_s$DateTime,hpc_s$Sub_metering_2,col="red")
lines(hpc_s$DateTime,hpc_s$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
dev.print(png,file="plot3.png",width=480,height=480)
dev.off()