ins<-readRDS("Source_Classification_Code.rds")
pol<-readRDS("summarySCC_PM25.rds")

dim(ins)
head(ins)
table(ins$EI.Sector)
chdata<- subset(ins, EI.Sector %in% c("Fuel Comb - Comm/Instutional - Coal", 
  "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - 
  Coal"))
chdata_v2<- subset(ins, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))
nrow(chdata)
nrow(chdata_v2)
difference<-setdiff(chdata$SCC,chdata_v2$SCC)
length(difference)
combdata<-union(chdata$SCC,chdata_v2$SCC)
length(combdata)
coalcomb <- subset(pol, SCC %in% combdata)
head(coalcomb)
ag4<-aggregate(coalcomb$Emissions,by=list(coalcomb$year),FUN=sum,na.rm=TRUE)

png("Plot4.png",width=550)

ggplot(ag4,aes(x=Group.1,y=x/1000))+geom_line()+
ggtitle(expression('Total PM'[2.5]*' of Coal Combustion-Related Sources from 1999–2008 in United States'))+
ylab("Emissions in Kilotons")+xlab("Year")

dev.off()