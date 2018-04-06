## Leer los datos, en inicio todos, despues se hace el subset de Feb y se borra lo demas para el espacio
dtAllData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dtFeb12 <- dtAllData[dtAllData$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dtAllData)

##Se convierte la variable a graficar a numerico ya que hist lo ocupa asi. 
##Se abre el dispositivo de archivo png y se grafica con hist y los parametros requeridos. Se cierra el dispositivo
globalActivePower <- as.numeric(dtFeb12$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
