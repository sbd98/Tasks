setwd("~/Desktop/Evolution/Tasks/Task04")

trueMean1 <- 5
trueSD1 <- 5
population1 <- rnorm(1e6, trueMean1, trueSD1)
trueMean2 <- 4
trueSD2 <- 5
population2 <- rnorm(1e6, trueMean2, trueSD2)

Size <- 50
Sample1 <- sample(population1, Size)
Sample2 <- sample(population2, Size)
boxplot(Sample1, Sample2)
# Based on the boxplot, the samples are taken by the same parameters, and based on the boxplot the populations seem to be similar

source("http://jonsmitchell.com/code/simFxn04.R")
MatGrandma <- makeFounder("grandma_mom")
MatGrandpa <- makeFounder("grandpa_mom")
PatGrandma <- makeFounder("grandma_da")
PatGrandpa <- makeFounder("grandpa_da")
head(MatGrandma)
head(MatGrandpa)
head(PatGrandma)
head(PatGrandpa)

Alan <- makeBaby(PatGrandma, PatGrandpa)
head(Alan)
Brenda <- makeBaby(MatGrandma, MatGrandpa)
head(Brenda)

Focus <- makeBaby(Brenda, Alan)
# The number should be 0.5

ToMom <- length(grep("mom", Focus))/length(Focus)
head(ToMom)
# I would say Focus shares 0.25 with each of his maternal grandparents. The actual numbers matched my expectations. 
ToMomMom <- length(grep("grandma_mom", Focus))/length(Focus)
ToMomDad <- length(grep("grandpa_mom", Focus))/length(Focus)
head(ToMomMom)
head(ToMomDad)
# Yes, Focus is pretty much equally related to each maternal grandparent. I would say it is the same for paternal grandparents. Average relatedness is 0.25.  

Sibling_01 <- makeBaby(Brenda, Alan)
# I would expect Focus to share 50% DNA with his Sibling_01. This is the amount actually shared.
head(Sibling_01)
ToSib <- length(intersect(Focus, Sibling_01))/length(Focus)
head(ToSib)
# I would say Focus shares 50% of the same genes as his 1000 other siblings.
ManySiblings <- replicate(1e3, length(intersect(Focus, makeBaby(Brenda, Alan)))/length(Focus))

quantile(ManySiblings)
mean(ManySiblings)
plot(density(ManySiblings), main="", xlab="proportion shared genes")
# A range of values are shown because there are different combinations of genes among each of the siblings. Some are more commonly inherited as seen with the mean, while the tails represent genes less commonly shared among them. 

HWE <- function(p)  { 
	aa <- p^2
	ab <- 2 * p * (1-p)
	bb <- (1-p)^2
	return(c(aa=aa, ab=ab, bb=bb))
	}
	HWE(0.5)

plot(1, 1, type="n", xlim=c(0,1), ylim=c(0,1), xlab="freq. allele a", ylab="geno. freq")

p <- seq(from=0, to=1, by= 0.01)
GenoFreq <- t(sapply(p, HWE))
lines(p, GenoFreq[,"aa"], lwd=2, col="red")
# Yes, I can read and understand this plot. The frequency of aa individuals increases as the frequency of the a allele increases in the population. As a decreases, aa decreases. Time and geographic space are not shown. 

lines(p, GenoFreq[,"ab"], lwd=2, col="purple")
lines(p, GenoFreq[,"ab"], lwd=2, col="blue")
legend("top", legend=c("aa", "ab", "bb"), col=c("red", "purple","blue"), lty=1, lwd=2, bty="n")
Pop <- simPop(500)
points(Pop[, "freqa"], Pop[, "Genotypes.aa"]/500, pch=21, bg="red")
# The frequency of aa matches Hardy-Weinberg

Pop <- simPop(50)
points(Pop[,"freqa"], Pop[,"Genotypes.aa"]/500, pch=22, bg="red")
# The frequency of aa does not match with the smaller population. The points seem to be staying even across at a "0" frequency. 

#install.packages("learnPopGen", dep=T)
library(learnPopGen)
x <- genetic.drift(Ne=200, nrep=5, pause=0.01)
x <- genetic.drift(Ne=100, nrep=5, pause=0.01)
PopSizes <- 5:50
Samples <- rep(PopSizes, 5)
tExt <- sapply(Samples, function(x) nrow(simPop(x, 500)))
Line <- lm(tExt ~ Samples)
summary(Line)
Line$coef
plot(Samples, tExt)
abline(Line)
Line2 <- lm(tExt~Samples+0)
Line <- lm(tExt~Samples)
# The distance between the points and the line increases as the population size increases. This means that it takes more time for alleles to go extinct. 