# plot1.R - Global Active Power Histogram
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
sub_df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
png("plot1.png", width=480, height=480)
hist(sub_df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
