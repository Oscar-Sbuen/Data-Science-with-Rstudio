data<-read.csv("../r-course-master/data/tema1/missing-data.csv",na.strings = "")
data$Income.mean <- ifelse(is.na(data$Income),
                           mean(data$Income,
                                na.rm =
                                  T),
                           data$Income)

#x es un vetor de datos que puede contener NA´s
rand.impute <- function(x){ 
  #missing contiene un vector de valores True or False dependiendo del NA de x
  missing <- is.na(x) 
  #n.missing contiene cuantos valores son NA dentro de missing
  n.missing <- sum(missing)
  #x.obs son los valores conocidos que tienen dato diferente de NA en x
  x.obs <- x[!missing]
  #por defecto devolvere lo mismo que habia entrado por parametro
  imputed <- x
  #en los valores que faltaban, los rempalzamos por una #muestra de los que si conocemos 
  imputed[missing]<- sample(x.obs,n.missing, replace=T)
  return(imputed)
}


random.impute.data.frame <- function(dataframe,cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],"imputed",sep = ".")
    dataframe[name]=rand.impute(dataframe[,col])
  }
  dataframe
}

data<-read.csv("../r-course-master/data/tema1/missing-data.csv",na.strings = "")
data$Income[data$Income==0]<-NA
data <- random.impute.data.frame(data,c(1,2))



