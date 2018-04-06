## Leer los datos, en inicio todos, despues se hace el subset de Feb y se borra lo demas para el espacio
dtAllData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dtFeb12 <- dtAllData[dtAllData$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dtAllData)

DateTime <- strptime(paste(dtFeb12$Date, dtFeb12$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dtFeb12$Global_active_power)
png("plot2.png", width=480, height=480)
plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
