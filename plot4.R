## Leer los datos, en inicio todos, despues se hace el subset de Feb y se borra lo demas para el espacio
dtAllData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dtFeb12 <- dtAllData[dtAllData$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dtAllData)

##Variables para el grafico 1,1
DateTime <- strptime(paste(dtFeb12$Date, dtFeb12$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dtFeb12$Global_active_power)
##Variables para el grafico 1,2
volt <- as.numeric(dtFeb12$Voltage)
##Variables para el grafico 2,1
sub1 <- as.numeric(dtFeb12$Sub_metering_1)
sub2 <- as.numeric(dtFeb12$Sub_metering_2)
sub3 <- as.numeric(dtFeb12$Sub_metering_3)
##Variables para el grafico 2,2
globalReactivePower <- as.numeric(dtFeb12$Global_reactive_power)

## Abrir el dispositivo
png("plot4.png", width=480, height=480)

##Definir dos filas y dos columnas, y hacer cada grafica con el comando with
par(mfrow=c(2,2))
with(dtFeb12,{
  plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(DateTime, volt, type="l", xlab="datetime", ylab="Voltage")
  plot(DateTime,sub1, ylab = "Energy sub metering", xlab = "", type="l", )
    lines(DateTime, sub2, type="l", col="red")
    lines(DateTime, sub3, type="l", col="blue")
    legend("topright", lty=1, lwd = 2, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

##Cerrar el dispositivo
dev.off()