
# Loading the "dplyr" and "tidyr" libraries 
library(dplyr)
library(tidyr)
unzip("exdata_data_household_power_consumption.zip")

# Checking names of the directories available in our woring directory
# in order to localise the one concerning us (e.g. "UCI HAR Dataset")
list.dirs(getwd())
list.files(getwd())

# Loading the txt file in a data frame
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

# --- Create and save plot in png file
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
