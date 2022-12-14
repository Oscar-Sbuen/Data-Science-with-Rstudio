install.packages("scales")
library(scales)
students <- read.csv("../r-course-master/data/tema1/data-conversion.csv")

students$Income.rescaled <- rescale(students$Income)

(students$Income-min(students$Income))/
  (max(students$Income)-min(students$Income))

rescale(students$Income,to=c(0,100))


rescale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "rescaled", sep=".")
    dataframe[name] <- rescale(dataframe[,col])
  }
  cat(paste("hemos reescalado", length(cols), "Variable's"))
  dataframe
}

students <- rescale.many(students,c(1,4))
