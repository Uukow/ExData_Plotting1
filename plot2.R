# plot2.R - Global Active Power Line Graph
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
sub_df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
sub_df$datetime <- strptime(paste(sub_df$Date, sub_df$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(sub_df$datetime, sub_df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
