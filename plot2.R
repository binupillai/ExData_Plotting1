#############################################################
#function to generate and save 2nd plot in the project1
############################################################
plot2 <- function(){
  
  d = read.table("household_power_consumption.txt", header=TRUE,sep=";")
  
  d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M") 
  d$Date <- as.Date(as.character(d$Date),format="%d/%m/%Y")
  
  d <- subset(d,(Date >= as.Date("1/2/2007",format="%d/%m/%Y") & Date <= as.Date("2/2/2007",format="%d/%m/%Y")))  

  myylab <- "Global Active Power (Kilowatts)"
  
  data <- as.numeric(as.character(d$Global_active_power),stringsAsFactors = FALSE)
   
  g_range <- range(0, data)
  
  plot(d$DateTime,data,type="l", col="black",ylim=g_range, ylab=myylab ,axes=T ,ann=F)  
    
  title(ylab="Global Active Power (kilowatts)", col.lab="black")
  
  box()
  
  dev.copy(png,file="plot2.png",width = 480, height = 480,units = "px")
  dev.off()
  
}
