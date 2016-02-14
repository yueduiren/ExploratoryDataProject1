setwd("/Users/Wenrui/Desktop/Datascience/EDweek1")
fileName <- "household_power_consumption.zip"
if(! file.exists(fileName)) {
        message("Downloading the data set archive...")
        fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url=fileURL,destfile=fileName,method="curl")
}

if(! file.exists("household_power_consumption.txt")) {
        message("Extracting the data set files from the archive...")
        unzip(zipfile=fileName, exdir="./")
}

system("(head -1 household_power_consumption.txt ; grep '^[1|2]/2/2007' household_power_consumption.txt ) > hpc.csv")

df <- read.csv("hpc.csv", header=TRUE, sep=';', na.strings='?')

png("plot1.png",width=480,height=480,units="px",bg="transparent")
message("Global Active Power Histogram")
hist(
        df$Global_active_power,
        col="red", 
        main="Global Active Power", 
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency"
)
dev.off()