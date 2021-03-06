#############################################################
#function to generate and save 4th plot in the project1
############################################################
plot4 <- function(){
  
  d = read.table("household_power_consumption.txt", header=TRUE,sep=";")
  
  d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M") 
  d$Date <- as.Date(as.character(d$Date),format="%d/%m/%Y")
  #d$Time <- strftime(d$Time,format="%H:%M:%S",tz="PST5PDT")
  
  d <- subset(d,(Date >= as.Date("1/2/2007",format="%d/%m/%Y") & Date <= as.Date("2/2/2007",format="%d/%m/%Y")))  

  par(mfrow=c(2,2))
  
  #### GlobalActive Power ############
  
  data <- as.numeric(as.character(d$Global_active_power),stringsAsFactors = FALSE)
  
  g_range <- range(0, data)
  
  plot(d$DateTime,data,type="l", col="black",ylim=g_range,ylab="Global Active Power (kilowatts)",axes=T, ann=F)
  
  title(ylab="Global Active Power (kilowatts)", col.lab="black")
  
  ####################################
  data.voltage <- as.numeric(as.character(d$Voltage),stringsAsFactors = FALSE)
  
  g_range <- range(234, 246)
  
  plot(d$DateTime,data.voltage,type="l", col="black",ylim=g_range,axes=T, ann=F)
  
  title(ylab="Voltage", col.lab="black")
  title(xlab="datetime", col.lab="black")
  #######################################
  
  plot_colors <- c("black", "red", "blue")
  
  d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1),stringsAsFactors = FALSE)
  
  d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2),stringsAsFactors = FALSE)
  
  d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3),stringsAsFactors = FALSE)
  
  
  g_range <- range(0, d$Sub_metering_1 )
  
  plot(d$DateTime,d$Sub_metering_1,type="l",ylim=g_range, col=plot_colors[1],axes=T, ann=F)
  
  title(ylab="Energy sub metering", col.lab="black")
  
  lines(d$DateTime,d$Sub_metering_2, type="l", col=plot_colors[2])
  lines(d$DateTime,d$Sub_metering_3, type="l", col=plot_colors[3])
  
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=plot_colors, 
         lty=1, lwd=2, bty="1");
  
  ##############################################################
  data.global_reactive_power <- as.numeric(as.character(d$Global_reactive_power),stringsAsFactors = FALSE)
  
  g_range <- range(0.0,data.global_reactive_power)
  
  plot(d$DateTime,data.global_reactive_power,type="l",ylim=g_range, col="black",axes=T, ann=F)
  
  title(ylab="Global _reactive_power", col.lab="black")
  title(xlab="datetime", col.lab="black")
  
  #############################################
  
  dev.copy(png,file="plot4.png",width = 480, height = 480,units = "px")
  dev.off()
  
}
