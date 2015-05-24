# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
png("plot6.png")

# Select Coal Combustion Related data
SCC.Motor <- SCC[grep("motor vehicle", SCC$Short.Name, ignore.case = T), c("SCC", "Short.Name")]
data <- subset(NEI, subset = NEI$SCC %in% SCC.Motor$SCC)
data.Bal <- data[data$fips == "24510", ]
data.Los <- data[data$fips == "06037", ]

data.Bal.sum <- with(data.Bal, tapply(Emissions, year, sum))
data.Los.sum <- with(data.Los, tapply(Emissions, year, sum))

plot(data.Bal.sum ~ names(data.Bal.sum), type = "l", col="blue", xlab = "year", ylab = "sum", xlim = c(1998, 2009), ylim = c(5, 80))
lines(formula = data.Los.sum ~ names(data.Los.sum), col = "red")
points(names(data.Bal.sum), data.Bal.sum, col = "blue")
points(names(data.Los.sum), data.Los.sum, col = "red")
legend("bottomright", legend = c("Baltimore", "Los Angeles"), col = c("blue", "red"), pch = "l")

title("Comparasion of Motor Vehicle Emissions")

dev.off()
