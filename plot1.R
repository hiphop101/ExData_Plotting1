setwd('/Users/tonychen/Documents/GitHub/ExData_Plotting1')
# Read data
hpc <- read.table('household_power_consumption.txt',
                  header = TRUE, sep=';')

# Cleansing the data
names(hpc) <- tolower(names(hpc))
hpc[,3:9] <- sapply(hpc[,3:9],as.character)
hpc[,3:9] <- sapply(hpc[,3:9],as.numeric)
hpc$date <- as.Date(hpc$date, '%d/%m/%Y')

shpc <- subset(hpc, date=='2007-02-01' | date=='2007-02-02')

hist(shpc$global_active_power, main='Global Active Power', xlab = 'Global Active Power (kilowatts)', col='red')
