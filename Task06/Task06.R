setwd('~/Desktop/Evolution/Tasks/Task06')
library("learnPopGen")
coalescent.plot()
coalescent.plot(n=10, ngen=20, colors=NULL)
coalescent.plot(n=20, ngen=40, colors=NULL)
coalescent.plot(n=50, ngen=25, colors=NULL)
#1. Each simulation begins with 10, 20, and 50 alleles, respectively. 
#2. On average, the number of alleles present is similar to how many generations it takes one allele to go to fixation.
#3. The average number of offspring each haploid individual has is 1. This number varies from 0-3 offspring.
#4. Fitness does not play a role.
#5. The most common ancestor is usually not alive in generation 0.
install.packages("coala")
install.packages("phytools")
library("coala")
install.packages("ape")
install.packages("maps")
library("phytools")

model<- coal_model(sample_size=5, loci_number=10, loci_length=500, ploidy=2)+
feat_mutation(10)+
feat_recombination(10)+
sumstat_trees()+
sumstat_nucleotide_div()

stats <- simulate(model, nsim=1)

Diversity<- stats$pi
head(Diversity)
#The numbers are not the same, there are 2 numbers that are different from the rest. Mutation or recombination could cause this.

Nloci <- length(stats$trees)
t1<- read.tree(text=stats$trees[[1]][1])
plot(t1)
axisPhylo()
#6. The number of tips doesn't match the number of simulated individuals because some fall under the same tip.

Agel<- max(nodeHeights(t1))

t2<- read.tree(text=stats$trees[[2]][1])
plot(t2)
axisPhylo()


par(mfrow=c(1,2))
plot(t1)
axisPhylo()
plot(t2)
axisPhylo()
#7. They do not match 
compare.chronograms(t1,t2)

t1_1<- read.tree(text=stats$trees[[1]][1])
t1_2<- read.tree(text=stats$trees[[1]][2])
compare.chronograms(t1_1, t1_2)

for(locus in 1:Nloci) {
	ntrees <- length(stats$trees[[locus]])
	for(n in 1:ntrees) { 
		if(locus==1&& n==1) {
			outPhy <- read.tree(text=stats$trees[[locus]][n])
			}
			else {
			outPhy <- ape:::c.phylo( outPhy, read.tree(text=stats$trees[[locus]][n]))
	 }
   }
}

	

par(mfrow=c(1,1))
densityTree(outPhy)


model3 <-coal_model(10, 50)+
	feat_mutation(par_prior("theta", sample.int(100, 1)))+
	sumstat_nucleotide_div()
stats <- simulate(model3, nsim=40)	

mean_pi <- sapply(stats, function(x) mean(x$pi))
theta <- sapply(stats, function(x) x$pars[["theta"]])
plot(mean_pi, theta)
abline(lm(mean_pi ~ theta))