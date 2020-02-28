setwd("~/Desktop/Evolution/Tasks/Project")
#I hypothesize that the higher "fit" tasmanian devils (higher number of offspring, longer survival, socially dominant) are becoming less suceptible to infection with devil facial tumor disease over time (DFTD).
#Tasmanian devils with higher fitness are more likely to be infected with the disease but are forming resistance
install.packages("readxl")
library("readxl")
my_data <- read_excel("TasDevil.xlsx")
head(my_data)
my_data <- read_excel("TasDevil.xlsx", na = "NA")

#I will be adding more data but I can't get the file to unzip 

