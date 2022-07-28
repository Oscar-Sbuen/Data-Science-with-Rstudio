students <- read.csv("../r-course-master/data/tema1/data-conversion.csv")

#creamos los breakpoints
bp <- c(-Inf, 10000, 31000, Inf)

names <- c("Low", "Avarage", "High")

students$Income.cat<- cut(students$Income, 
                          breaks = bp, labels=names)

students$Income.cat2<- cut(students$Income, 
                          breaks = bp)
students$Income.cat3<-cut(students$Income, breaks=4, labels=c("Level 1", "Level 2", "Level 3", "Level 4"))


#dummy variables
students <- read.csv("../r-course-master/data/tema1/data-conversion.csv")
install.packages("dummies")
library(dummy)

students.dummy <- dummy(students, int = T, verbose = T)
names(students.dummy)

dummy.coef.lm(students$State)
