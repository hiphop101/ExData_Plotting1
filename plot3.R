setwd('/Users/tonychen/Documents/GitHub/ExData_Plotting1')
# Read data
hpc <- read.table('household_power_consumption.txt',
                  header = TRUE, sep=';')

# Cleansing the data
names(hpc) <- tolower(names(hpc))
hpc$time <- as.character(hpc$time)
hpc[,3:9] <- sapply(hpc[,3:9],as.character)
hpc[,3:9] <- sapply(hpc[,3:9],as.numeric)
hpc$date <- as.Date(hpc$date, '%d/%m/%Y')

shpc <- subset(hpc, date=='2007-02-01' | date=='2007-02-02')

shpc$datetime <- paste(shpc$date, shpc$time)
shpc$datetime <- as.POSIXct(shpc$datetime)

plot(shpc$sub_metering_1 ~ shpc$datetime, type='l', ylab = 'Energy sub metering', xlab='')
lines(shpc$sub_metering_2 ~ shpc$datetime , type='l', col='red')
lines(shpc$sub_metering_3 ~ shpc$datetime , type='l', col='blue')
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
