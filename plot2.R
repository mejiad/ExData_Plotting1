library(lubridate)

consumo_original <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

consumo_1 <- mutate(consumo_original, date_time = dmy_hms(paste(consumo_original$Date, consumo_original$Time, sep = " "), tz = Sys.timezone()))

consumo_2 <- filter(consumo_1, date_time >= "2007-02-01 00:00:00" & date_time < "2007-02-03 00:00:00")


png(file = "plot2.png", bg = "transparent")
par(mfrow= c(1,1))
plot(consumo_2$date_time, consumo_2$Global_active_power, type = "n", ylab = "Global Activity Power (kilowats)", xlab = "")
lines(consumo_2$date_time, consumo_2$Global_active_power)
dev.off()