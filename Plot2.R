pol<-readRDS("summarySCC_PM25.rds")

mldata<-subset(pol,fips=="24510")
head(mldata)
dim(mldata)
ag2<-aggregate(mldata$Emissions,by=list(mldata$year),FUN=sum,na.rm=TRUE)

png("Plot2.png")

barplot(height=ag2$x, names.arg=ag2$Group.1, xlab="Years", 
ylab=expression('Emissions of PM'[2.5]*' (tons)'),
main=expression('Total PM'[2.5]*' Emissions in Maryland'),col=ag2$Group.1,ylim=c(0,4000))

dev.off()
