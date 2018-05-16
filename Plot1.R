
pol<-readRDS("summarySCC_PM25.rds")

#sum up the emission that belongs to the same year
ag<-aggregate(pol$Emissions,by=list(pol$year),FUN=sum,na.rm=TRUE)

ag$Group.1

png("Plot1.png")
barplot(height=ag$x/1000, names.arg=ag$Group.1, xlab="Years", 
ylab=expression('Total PM'[2.5]*' Emissions in Kilotons'),
main=expression('Total PM'[2.5]*' Emissions in Kilotons for Various Years'),
ylim=c(0,8000),col=ag$Group.1)
dev.off()