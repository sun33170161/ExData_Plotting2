# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
png("plot1.png")

NEI.groups.sum <- with(NEI, tapply(Emissions, year, sum))

plot(NEI.groups.sum ~ names(NEI.groups.sum), type = "l", xlab = "year", ylab = "sum")
title("Trend of Total PM2.5 Emissions")

dev.off()

