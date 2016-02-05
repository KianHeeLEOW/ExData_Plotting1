##Function to load the data from 2007-02-01 to 2007-02-02

load_household_power <- function() {
  fh <- file("household_power_consumption.txt")
  power <- read.table(fh, header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  df$Voltage <- as.numeric(as.character(df$Voltage))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
}

#function to plot1
plot1 <- function() {
  par(mfrow=c(1,1))
  hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
}
plot1()