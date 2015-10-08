#### R code for reading the data to be plotted in plot2.png
install.packages("readr")
require(readr)
# Acquire Column names
hpcNames <- names(read_delim("household_power_consumption.txt", delim = ";", col_names = TRUE, n_max = 0))

# Acquire data selecting only the subset from 01/02/2007 and 02/02/2007
hpc <- read_delim("household_power_consumption.txt", delim = ";", na = "?", 
                col_names = hpcNames, skip = 66637, n_max = 2880)
# Adding a column with date & time used for plotting
hpc$dateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
# plot the graphic into plot2.png file
png(file="plot2.png")
plot(hpc$dateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()