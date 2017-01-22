#This function is created for the Week 1 project for the Exploratory Data 
#Analysis Course.
#The source of the data used was:
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#The data must be saved in the working directory.
#The function produces a histogram of the "Global Active Power", 
# for the dates 2007-02-01 ~ 2007-02-02. 

plot1 <- function()
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
        png(filename = "plot1.png")
        
        #Create Histogram
        with(mydata, hist(mydata[,3],
                          main = "Global Active Power",
                          xlab = "Global Active Power (kilowatts)",
                          ylab = "Frequency",
                          col = "red"))
        
        #Close file connection
        dev.off()          
        
}
