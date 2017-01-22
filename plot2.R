#This function is created for the Week 1 project for the Exploratory Data 
#Analysis Course.
#The source of the data used was:
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#The data must be saved in the working directory.

#The function produces a line plot of the "Global Active Power", 
# for the dates 2007-02-01 ~ 2007-02-02. 

plot2 <- function()
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
        png(filename = "plot2.png")
        
        #Create Plot
        with(mydata, plot(x=DateTime,y=Global_active_power, type="l",
                          xlab=""))
        
        #Close file connection
        dev.off()          
        
}
