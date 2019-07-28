
# Loading the "dplyr" and "tidyr" libraries 
library(dplyr)
library(tidyr)
unzip("exdata_data_household_power_consumption.zip")

# Checking names of the directories available in our woring directory
# in order to localise the one concerning us (e.g. "UCI HAR Dataset")
list.dirs(getwd())
list.files(getwd())


my_data <- read.delim("./household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")

# Filtering only the rows corresponding to the dates we're interested in 
my_data <- filter(my_data, Date == "2007/02/01" | Date == "2007/02/02")
# Uniting tha date and time collumns
my_data <- unite(my_data, "Date_Time", c("Date","Time"), sep = " ")
# We are converting the resulting character vector into class "POSIXlt" 
my_data$Date_Time <- strptime(my_data$Date_Time, format="%Y-%m-%d %T")


# --- Create and save plot in png file
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
