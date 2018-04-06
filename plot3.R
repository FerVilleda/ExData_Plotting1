## Leer los datos, en inicio todos, despues se hace el subset de Feb y se borra lo demas para el espacio
dtAllData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dtFeb12 <- dtAllData[dtAllData$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dtAllData)

DateTime <- strptime(paste(dtFeb12$Date, dtFeb12$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(dtFeb12$Sub_metering_1)
sub2 <- as.numeric(dtFeb12$Sub_metering_2)
sub3 <- as.numeric(dtFeb12$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(DateTime,sub1, ylab = "Energy sub metering", xlab = "", type="l", )
lines(DateTime, sub2, type="l", col="red")
lines(DateTime, sub3, type="l", col="blue")
legend("topright", lty=1, lwd = 2, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()