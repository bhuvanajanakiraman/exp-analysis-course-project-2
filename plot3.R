NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subsetNEI<-subset(NEI,NEI$fips=="24510")
aggsubsetNEIwithtype<-aggregate(Emissions~year+type,subsetNEI,sum)

png("plot3.png",height = 480,width = 480)
g<-ggplot(aggsubsetNEIwithtype,aes(year,Emissions,color=type))
g+geom_line(size=4)+labs(list(x="year",y="Total PM2.5 Emissions",title="Total PM2.5 Emissions in Baltimorecity") )
dev.off()