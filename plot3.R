# Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot
png("plot3.png")

NEI.Baltimore <- NEI[NEI$fips == "24510", ]
data.groups <- with(NEI.Baltimore, tapply(Emissions, list(year, type), sum))

# feed the plot data
data.newgroups <- data.frame()
for(c in colnames(data.groups)){
  for(r in rownames(data.groups)){
    data.newgroups <- rbind(data.newgroups, data.frame(year=r, type=c, sum=data.groups[r, c]))
  }
}
data.newgroups

library(ggplot2)
qplot(year, sum, facets = type ~ ., data = data.newgroups, main = "Trend of Total PM2.5 Emissions in Baltimore City by Type")

dev.off()
