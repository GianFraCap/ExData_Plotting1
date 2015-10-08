#### R code for reading the data to be plotted in plot4.png
install.packages("readr")
require(readr)
# Acquire Column names
hpcNames <- names(read_delim("household_power_consumption.txt", delim = ";", col_names = TRUE, n_max = 0))

# Acquire data selecting only the subset from 01/02/2007 and 02/02/2007
hpc <- read_delim("household_power_consumption.txt", delim = ";", na = "?", 
                col_names = hpcNames, skip = 66637, n_max = 2880)
# Adding a column with date & time used for plotting
hpc$dateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
# plot the graphic into plot3.png file
png(file="plot4.png")
par(mfcol= c(2,2))
#
plot(hpc$dateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#
plot(hpc$dateTime, hpc$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
points(hpc$dateTime, hpc$Sub_metering_2, type="l", xlab="", ylab="Global Active Power (kilowatts)", col="red")
points(hpc$dateTime, hpc$Sub_metering_3, type="l", xlab="", ylab="Global Active Power (kilowatts)", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
plot(hpc$dateTime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")
#
plot(hpc$dateTime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

