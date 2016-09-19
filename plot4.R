library(lubridate)

par(mfcol = c(2,2))

consumo_original <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

consumo_1 <- mutate(consumo_original, date_time = dmy_hms(paste(consumo_original$Date, consumo_original$Time, sep = " "), tz = Sys.timezone()))

consumo_2 <- filter(consumo_1, date_time >= "2007-02-01 00:00:00" & date_time < "2007-02-03 00:00:00")



png(file = "plot4.png", bg = "transparent")
par(mfrow = c(2,2))
plot(consumo_2$date_time, consumo_2$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
lines(consumo_2$date_time, consumo_2$Global_active_power)


plot(consumo_2$date_time, consumo_2$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(consumo_2$date_time, consumo_2$Voltage)


plot(consumo_2$date_time, consumo_2$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(consumo_2$date_time, consumo_2$Sub_metering_1)
lines(consumo_2$date_time, consumo_2$Sub_metering_2, col = "red")
lines(consumo_2$date_time, consumo_2$Sub_metering_3, col = "blue")

s <- summary(consumo_2$date_time)
legend(x = s[4], y = 41, lty = c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0, ncol = 1, text.width = 45000)



plot(consumo_2$date_time, consumo_2$Global_reactive_power, type="n", ylab = "Global_active_power", xlab = "datetime")
lines(consumo_2$date_time, consumo_2$Global_reactive_power)

dev.off()
