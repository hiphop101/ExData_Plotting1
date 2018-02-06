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

plot(shpc$global_active_power ~ shpc$datetime,
     type='l',
     ylab = 'Global Active Power (kilowatts)',
     xlab='')
