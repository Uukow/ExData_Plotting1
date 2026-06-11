# plot3.R - Energy Sub Metering
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
sub_df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
sub_df$datetime <- strptime(paste(sub_df$Date, sub_df$Time), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(sub_df$datetime, sub_df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub_df$datetime, sub_df$Sub_metering_2, col="red")
lines(sub_df$datetime, sub_df$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
