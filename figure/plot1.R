setwd("C:\\Users\\Ming\\Google Drive\\R\\EDA")
temp <- tempfile(fileext=".zip")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , destfil = temp )
dateDownloaded = date()
data <- read.table(unz(temp, "household_power_consumption.txt"),,sep=";",header = T)
# data = read.table("data.txt",sep=";",header = T)
unlink(temp)
dates = data[,1]
dts = as.Date(strptime(dates,"%d/%m/%Y"))
ldt = as.Date(strptime("2007-02-01", "%Y-%m-%d"))
udt = as.Date(strptime("2007-02-02", "%Y-%m-%d"))
sub = data[(dts == ldt | dts == udt),]
Global_active_power = as.numeric(as.character(sub$Global_active_power))
png(filename = "plot1.png",width = 480, height = 480)
hist(Global_active_power, col = "red",
     main="Global Active Power", xlab = "Global Active Power(killowatts)")
dev.off() ## Don't forget to close the PNG device!
