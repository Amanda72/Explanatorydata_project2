pol<-readRDS("summarySCC_PM25.rds")
mldata<-subset(pol,fips=="24510")

ag3<-aggregate(mldata$Emissions,by=list(mldata$year,mldata$type),FUN=sum,na.rm=TRUE)
str(ag3)

png("Plot3.png")

ggplot(ag3,aes(x=Group.1,y=x,color=Group.2))+geom_line()+xlab("Year")+ylab("Emission(tons)")+
ggtitle("Types of Sources in emissions from 1999–2008 for Baltimore City")

dev.off()