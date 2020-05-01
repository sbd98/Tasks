setwd("~/Desktop/Evolution/Tasks/Project/data")

install.packages("readxl")
library(readxl)
read_excel("TasDevil.xlsx")
head(my_data)
my_data <- read_excel("TasDevil.xlsx", na = "NA")

nrow(na.omit(my_data))
my_data$Capture.Date
my_data$Capture.TumourLoad
na.omit(my_data)
plot(my_data$Capture.Date, my_data$Capture.TumourLoad, xlab="Year", ylab="Tumor Load", type="p", main="Tumor Load of DFTD Among Tasmanian Devils is Decreasing Over Time", pch=19, log="y")

pdf("DFTD.pdf", height = 6, width = 8)
plot(my_data$Capture.Date, my_data$Capture.TumourLoad, xlab="Year", ylab="Tumor Load", type="p", main="Tumor Load of DFTD Among Tasmanian Devils is Decreasing Over Time", pch=19, log="y")
dev.off()

# What I've done: Collected data over 10 years on Tasmanian devils & created a plot to show a decreased load/occurrence of DFTD over time.
#Analysis Plan: What I want to do: Show decreasing load/occurrence of DFTD among Tasmanian devils, maybe expain why/how this is happening (resistance? If so, how?) 
#What I still have left to do: find more studies on DFTD 

read_excel("DFTD samples 2006-2011:Anthropogenic .xls")
my_data2 <- read_excel("DFTD samples 2006-2011:Anthropogenic .xls")


plot(my_data2$year2, my_data2$Tetraploidy2, type="h", xlab="Year", ylab="Tetraploid Samples", main="Tetraploid Tumor Prevalence in Devils", lwd=6)
pdf("Tetraploid.pdf", height=6, width=8)
plot(my_data2$year2, my_data2$Tetraploidy2, type="h", xlab="Year", ylab="Tetraploid Samples", main="Tetraploid Tumor Prevalence in Devils", lwd=6)
dev.off()