# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
png("plot5.png")

# Select Coal Combustion Related data
SCC.Motor <- SCC[grep("motor vehicle", SCC$Short.Name, ignore.case = T), c("SCC", "Short.Name")]
data <- subset(NEI, subset = NEI$SCC %in% SCC.Motor$SCC)
data <- data[data$fips == "24510", ]
data.groups.sum <- with(data, tapply(Emissions, year, sum))

plot(data.groups.sum ~ names(data.groups.sum), type = "l", xlab = "year", ylab = "sum")
title("Trend of Motor Vehicle")

dev.off()
