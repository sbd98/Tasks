setwd("~/Desktop/Evolution/Programming/Task_02")
Data <- read.csv("http://jonsmitchell.com/data/beren.csv", stringsAsFactors=F)
length(Data)
nrow(Data)
ncol(Data)
colnames(Data)
head(Data)
Data[1,]
Data[2,]
Data[1:3,]
Data[1:3, 4]
Data[1:5, 1:3]
Feeds <- which(Data[,9] == "bottle")
berenMilk <- Data[Feeds,]
head(berenMilk)
Feeds <- which(Data[,"event"] == "bottle")
Feeds <- which(Data$event == "bottle")
dayID <- apply(Data, 1, function(x) paste(x[1:3], collapse="-"))
dateID <- sapply(dayID, as.Date, format = "%Y-%m-%d", origin = "2019-04-18")
Data$age <- dateID - dateID [which(Data$event == "birth")]
head(Data)
beren2 <- Data
beren3 <- beren2[order(beren2$age),]
write.csv(beren3, "beren_new.csv", quote=F, row.names=FALSE)
Feeds <- which(beren3$event == "bottle")
avgMilk <- mean(beren3$value[Feeds])
avgFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], mean)
varFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], var)
totalFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], sum)
numFeeds <- tapply(beren3$value[Feeds], beren3$age[Feeds], length)
cor(beren3$value[Feeds], beren3$age[Feeds])
cor.test(beren3$value[Feeds], beren3$age[Feeds])
berenCor <- cor.test(beren3$value[Feeds], beren3$age[Feeds])
summary(berenCor)
berenANOVA <- aov(beren3$value[Feeds] ~ beren3$caregiver[Feeds])
boxplot(beren3$value[Feeds] ~ beren3$caregiver[Feeds], xlab= "who gave the bottle", ylab = "amount of milk consumed (oz)")
?par
par(las=1, mar=c(5, 5, 1, 1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces of milk")
abline(h=avgFeed, lty=2, col='red')
pdf("r02b-totalMilkByDay.pdf", height = 4, width = 4)
par(las=1, mar=c(5, 5, 1, 1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces of milk")
abline(h=mean(totalFeed), lty=2, col='red')

Naps <- which(beren3$event == "nap")
beren4 <- beren3[Naps,]
head(beren4)
beren4[5:6]
beren4[7:8]
beren4$end_minute <- beren4$end_minute / 60
beren4$start_minute <- beren4$start_minute / 60
beren4$napstart <- beren4$start_hour + beren4$start_minute
beren4$napend <- beren4$end_hour + beren4$end_minute
beren4$naplength <- beren4$napend - beren4$napstart
naptime <- tapply(beren4$day[Naps], beren4$age [Naps], sum)
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5 ,0), tck=-.01) 
plot(as.numeric(names(naptime)), naptime, type="b", pch=16, xlab="day", ylab="naptime")
cor.test(beren4$age, naplength)