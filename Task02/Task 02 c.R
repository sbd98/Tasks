# The rate at which Beren grows is speeding up over time

setwd("~/Desktop/Evolution/Tasks/Task02")
beren4 <- read.csv("beren_new.csv", stringsAsFactors=F)

Growth <- which(beren4$value == "trait_mass")


par(las=1, mar=c(5, 5, 1, 1), mgp=c(2, 0.5, 0), tck =-0.01)
plot(as.numeric(names(beren4$value[Growth] ~ beren4$age[Growth])), type="b", pch=16, xlab="age in days", ylab="mass in kg", xlim=c(0, 218), ylim=c(4, 10))

