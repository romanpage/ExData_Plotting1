###################################
# Exploratory Data Analysis
# Course Project 1: Plot 1
###################################

setwd("/Users/roman/Documents/Coursera_DataScience/4_ExploratoryDataAnalysis/GitRepos/ExData_Plotting1")

## read files into work directory
epcData <- read.table("/Users/roman/Documents/Coursera_DataScience/4_ExploratoryDataAnalysis/data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

head(epcData)
tail(epcData)
summary(epcData)
str(epcData)

# convert the Date and Time variables to Date/Time
epcData$datetime <- strptime(paste(epcData$Date, epcData$Time), format="%d/%m/%Y %H:%M:%S", tz="Europe/Paris")
str(epcData)
summary(epcData)

# subset data from the dates 2007-02-01 and 2007-02-02
epcData2 <- epcData[(epcData$datetime >= "2007-02-01 00:00:00" & epcData$datetime < "2007-02-02 23:59:59"),]
str(epcData2)
summary(epcData2)

length(epcData2$Global_active_power)

# plot 1
png(file = "plot1.png", width = 480, height = 480)
par(mfrow = c(1,1), mar = c(4,4,1,2), par(oma=c(1,1,1,1)), cex = 0.9)
hist(as.numeric(epcData2$Global_active_power), col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
