ins<-readRDS("Source_Classification_Code.rds")
pol<-readRDS("summarySCC_PM25.rds")

mv_bal<- subset(pol,fips=="24510"&type=="ON-ROAD")
ag5<-aggregate(mv_bal$Emissions,by=list(mv_bal$year),FUN=sum,na.rm=TRUE)

png("Plot5.png")

ggplot(ag5,aes(x=Group.1,y=x))+geom_line()+
ggtitle(expression('Total PM'[2.5]*' of Motor Vechicle Sources from 1999–2008 in Baltimore City'))+
ylab("Emissions in tons")+xlab("Year")

dev.off()