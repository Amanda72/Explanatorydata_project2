ins<-readRDS("Source_Classification_Code.rds")
pol<-readRDS("summarySCC_PM25.rds")

mv_LA_bal<-subset(pol,fips%in%c("06037","24510")&type=="ON-ROAD")
ag6<-aggregate(mv_LA_bal$Emissions,by=list(mv_LA_bal$fips,mv_LA_bal$year),FUN=sum,na.rm=TRUE)
ag6$town<-ifelse(ag6$Group.1=="06037","Los Angeles","Baltimore city")

png("Plot6.png",width=550)

ggplot(ag6,aes(x=Group.2,y=x,color=town))+geom_line()+
ggtitle(expression('Total PM'[2.5]*' of Motor Vechicle Sources in Baltimore City and Los Angeles County'))+
ylab("Emissions in tons")+xlab("Year")

dev.off()