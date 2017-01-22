#This function is created for the Week 1 project for the Exploratory Data 
#Analysis Course.
#The source of the data used was:
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#The data must be saved in the working directory.
#The function produces a histogram of the "Global Active Power", 
# for the dates 2007-02-01 ~ 2007-02-02. 

plot4 <- function()
{
        
        #Load data
        mydata <- read.csv(file = "household_power_consumption.txt", sep = ";", 
                           header = TRUE, na.strings = "?")
        
        #Create DateTime Col
        mydata$DateTime <- as.POSIXct(paste(as.character(mydata$Date), 
                                            as.character(mydata$Time)),
                                            format="%d/%m/%Y %H:%M:%S")
        
        # Subset data to required dates
        mydata <- subset(mydata, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
        
        #Initiate png plot device
        png(filename = "plot4.png")
        
        #Define Layout
        par(mfrow=c(2,2))
        
        #Create Plots
        with(mydata, {
                plot(x=DateTime,y=Global_active_power, type="l",
                        xlab="")
             
                plot(x=DateTime,y=Voltage, type="l")
             
                plot(x=DateTime,y=Sub_metering_1, type="l",
                          xlab="", ylab="Energy sub metering",
                          col="black")
                #Add second line
                with(mydata, lines(x=DateTime,y=Sub_metering_2,
                                   col="red"))
                #Add third line
                with(mydata, lines(x=DateTime,y=Sub_metering_3,
                                   col="blue"))
                #Add legend
                legend("topright", lty=1, col = c("black", "red", "blue"), 
                       legend = c("Sub_metering_1", "Sub_metering_2", 
                                  "Sub_metering_3"))
                
                plot(x=DateTime,y=Global_reactive_power, type="l")
        })
        
        #Close file connection
        dev.off()          
        
}
