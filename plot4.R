NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC<-merge(NEI,SCC,by="SCC")
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC<-NEISCC[coalMatches,]
aggNEISCC<-aggregate(Emissions~year,subsetNEISCC,sum)
png("plot4.png",height = 550,width=550)
barplot(height=aggNEISCC$Emissions,names.arg = aggNEISCC$year,col=c("pink","green","orange","yellow"),xlab = "year",ylab = "PM2.5 Emissions",main="total emission from coal sources")
dev.off()