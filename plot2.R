# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
png("plot2.png")

NEI.Baltimore <- NEI[NEI$fips == "24510", ]
NEI.Baltimore.groups.sum <- with(NEI.Baltimore, tapply(Emissions, year, sum))

plot(NEI.Baltimore.groups.sum ~ names(NEI.Baltimore.groups.sum), type = "l", xlab = "year", ylab = "sum")
title("Trend of Total PM2.5 Emissions in Baltimore City")

dev.off()
