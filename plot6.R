NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC<-merge(NEI,SCC,by="SCC")
subsetNEI<-subset(NEI,NEI$fips=="24510")
subsetNEI2<-subsetNEI[subsetNEI$type=="ON-ROAD",]
aggsubsetNEIfips<-aggregate(Emissions~year+fips,subsetNEI2,sum)
aggsubsetNEIfips$fips<-"BaltimoreCity,MD"
#subseting fips=06037 and motor vehicle
subsetLA<-NEI[NEI$fips=="06037",]
subsetLAvehicle<-subsetLA[subsetLA$type=="ON-ROAD",]
aggsubsetLAvehicle<-aggregate(Emissions~year+fips,subsetLAvehicle,sum)
aggsubsetLAvehicle$fips<-"LosAngels,CA"
aggfips<-rbind(aggsubsetNEIfips,aggsubsetLAvehicle)
png("plot6.png",height = 550,width = 550)
g<-ggplot(aggfips,aes(factor(year),Emissions,fill=fips))
g+facet_grid(.~fips)+geom_bar(stat="identity",aes(fill=year))+labs(list(x="year",y="total PM2.5 Emissions",title="Total Emissions from motor vehicle in Baltimore City, MD vs Los Angeles, CA  1999-2008"))
dev.off()