NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC<-merge(NEI,SCC,by="SCC")
subsetNEI<-subset(NEI,NEI$fips=="24510")
subsetNEI2<-subsetNEI[subsetNEI$type=="ON-ROAD",]
aggsubsetNEI2<-aggregate(Emissions~year,subsetNEI2,sum)
png("plot5.png",height = 550,width=550)

g<-ggplot(aggsubsetNEI2,aes(factor(year),Emissions))
g+geom_bar(stat = "identity",fill="pink")+labs(list(x="year",y="totalPM2.5 Emissions",title="Total Emissions from motor vehicle in Baltimore City, Maryland from 1999 to 2008"))
dev.off()