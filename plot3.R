
library(dplyr)
library(lubridate)

# consumo <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

consumo_original <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

consumo_1 <- mutate(consumo_original, date_time = dmy_hms(paste(consumo_original$Date, consumo_original$Time, sep = " "), tz = Sys.timezone()))

consumo_2 <- filter(consumo_1, date_time >= "2007-02-01 00:00:00" & date_time < "2007-02-03 00:00:00")


png(file = "plot3.png", width=480, height=480)
par(mfrow= c(1,1))
plot(consumo_2$date_time, consumo_2$Global_active_power, type = "n", ylim = c(0,40), ylab = "Energy Sub metering", xlab = "" )
lines(consumo_2$date_time, consumo_2$Sub_metering_1)
lines(consumo_2$date_time, consumo_2$Sub_metering_2, col = "red")
lines(consumo_2$date_time, consumo_2$Sub_metering_3, col = "blue")

s <- summary(consumo_2$date_time)
# legend(x = s[5], y = 41, border = "red", lty = c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 1, text.width = 45000)

legend(x = s[4], y = 41, lty = c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 1, ncol = 1, text.width = 45000)

dev.off()

