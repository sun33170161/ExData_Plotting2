# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
png("plot4.png")

# Select Coal Combustion Related data
SCC.Combustion <- SCC[grep("combustion", SCC$Short.Name, ignore.case = T), c("SCC", "Short.Name")]
SCC.COAL <- SCC.Combustion[grep("coal", SCC.Combustion$Short.Name, ignore.case = T), ]
data <- subset(NEI, subset = NEI$SCC %in% SCC.COAL$SCC)

data.groups.sum <- with(data, tapply(Emissions, year, sum))

plot(data.groups.sum ~ names(data.groups.sum), type = "l", xlab = "year", ylab = "sum")
title("Trend of Coal Combustion Sources")

dev.off()
