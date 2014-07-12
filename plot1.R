#############################################################
#function to generate and save first graph in the project1
############################################################
plot1 <- function(){
  
  d = read.table("household_power_consumption.txt", header=TRUE,sep=";")
  
  d$Date <- as.Date(as.character(d$Date),format="%d/%m/%Y")
  #d$Time <- strftime(d$Time,format="%H:%M:%S",tz="PST5PDT")
  
  d <- subset(d,(Date >= as.Date("1/2/2007",format="%d/%m/%Y") & Date <= as.Date("2/2/2007",format="%d/%m/%Y")))  
  mymain <- paste("Global Active Power")
  myxlab <- "Global Active Power (Kilowatts)"
  myylab <- "Frequency"
  mybreaks=seq(0,6, by = .5)

  data <- as.numeric(as.character(d$Global_active_power),stringsAsFactors = FALSE)
  
  hist(data,main=mymain,col="red",xlab=myxlab,ylab=myylab)

  dev.copy(png,file="plot1.png",width = 480, height = 480,units = "px")

  dev.off()
  
}