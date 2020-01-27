# Hypothesis: The rate at which Beren grows is speeding up over time

setwd("~/Desktop/Evolution/Tasks/Task02")
beren4 <- read.csv("beren_new.csv", stringsAsFactors=F)
head(beren4)
Weight <- which(beren4$event == "trait_mass")

Weight[1:4]
par(las=1, mar=c(5, 5, 1, 1), mgp=c(2, 0.5, 0), tck =-0.01)
plot(beren4$age[Weight], beren4$value[Weight], type="p", xlab="age in days", ylab="mass in kg")

pdf("BerenGrowthOverTime.pdf")
par(las=1, mar=c(5, 5, 1, 1), mgp=c(2, 0.5, 0), tck =-0.01)
plot(beren4$age[Weight], beren4$value[Weight], type="p", xlab="age in days", ylab="mass in kg")
dev.off()

