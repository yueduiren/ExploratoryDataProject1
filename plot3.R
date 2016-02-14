# Extract a subset of the data for the dates 2007-02-01 and 2007-02-02
system("(head -1 household_power_consumption.txt ; grep '^[1|2]/2/2007' household_power_consumption.txt ) > hpc.csv")

# Read in the data set
df <- read.csv("hpc.csv", header=TRUE, sep=';', na.strings='?')

# Compute timestamp field
df$datetime <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M")

# Plot the Data!
png("plot3.png",width=480,height=480,units="px",bg="transparent")

message("Energy Sub Metering Plot")
plot(
        df$datetime,
        df$Sub_metering_1,
        xlab ="",
        ylab = "Energy sub metering",
        type ="l",
        col = 'black'
)

lines(
        df$datetime,
        df$Sub_metering_2,
        col = "red"
)

lines(
        df$datetime,
        df$Sub_metering_3,
        col = "blue"
)

legend(
        'topright',
        c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col = c('black','red','blue'), 
        lty = 1, 
        lwd = 3
)

dev.off() 