setwd("~/Desktop/Evolution/Tasks/Task09")
install.packages("phytools")
library("phytools")
tree <- force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))
plot(tree, type="fan")
str(tree)

compute.brlen(tree)
# 1. 82 tips and branch lengths are present

data <- read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors=F, row.names=1)
head(data)
class(data)
dim(data)
#2. "data" is a data frame. It has 100 rows and 1 column. 

svl <- setNames(data$svl, rownames(data))
Ancestors <- fastAnc(tree, svl[trees$tip.label], vars=TRUE, CI=TRUE)
# I am still getting an error with the Ancestors code so this is all I got 