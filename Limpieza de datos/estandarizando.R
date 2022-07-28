housing <- read.csv("../r-course-master/data/tema1/BostonHousing.csv")

housing.z <- scale(housing)
housing.none <- scale(housing, center=T, scale=F)
housing.none <- scale(housing, center=F, scale=T)
housing.none <- scale(housing, center=F, scale=F)

#sd = sqrt(sum(x^2)/(n-1))

scale.many = function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],"z", sep=".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado", length(cols), "variables's"))
}

housing <-scale.many(housing, c(1,3, 5:8))

