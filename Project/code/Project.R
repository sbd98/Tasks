setwd("~/Desktop/Evolution/Tasks/Project/data")

install.packages("readxl")
library(readxl)
read_excel("TasDevil.xlsx")
head(my_data)
my_data <- read_excel("TasDevil.xlsx", na = "NA")

my_data$Capture.Date
my_data$Capture.TumourLoad
na.omit(my_data)
plot(my_data$Capture.Date, my_data$Capture.TumourLoad, xlab="Capture Date", ylab="Tumor Load", type="p", main="Tumor Load of DFTD Among Tasmanian Devils is Decreasing Over Time")

# What I've done: Collected data over 10 years on Tasmanian devils & created a plot to show a decreased load/occurrence of DFTD over time.
#Analysis Plan: What I want to do: Show decreasing load/occurrence of DFTD among Tasmanian devils, maybe expain why/how this is happening (resistance? If so, how?) 
#What I still have left to do: find more studies on DFTD 

