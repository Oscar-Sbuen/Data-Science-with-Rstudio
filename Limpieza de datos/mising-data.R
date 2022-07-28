housing.data <- read.csv("../r-course-master/data/tema1/housing-with-missing-value.csv", header=T, stringsAsFactors = F)

summary(housing.data)

#El primer Quartil se refiere al 25% de los datos. Mean es el valor medio y el tercer Quartil es el valor al 75%.

#Eliminar todas las observaciones que contengan un Na
#la opción mas facil.
housing.data.1 <- na.omit(housing.data)
summary(housing.data.1)

#eliminar las Na's de ciertas columnas

drop_na <- c("rad")
housing.data.2 <- housing.data[
  complete.cases(housing.data[ ,!(names(housing.data))%in% drop_na]),]

summary(housing.data.2)


#Eliminar unatoda una columna del DF

housing.data$rad <- NULL
summary(housing.data)

drops <- c("rad","ptratio")
housing.data.3 <- housing.data[,!(names(housing.data)%in% drops)]
summary(housing.data.3)




install.packages("Hmisc")
library(Hmisc)



housing.data.copy1 <- housing.data
housing.data.copy1$impute_pratio <- impute(housing.data.copy1$pratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)


housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)
summary(housing.data.copy2)


housing.data.copy3 <- housing.data
housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)

install.packages("mice")


md.pattern(housing.data)

install.packages("VIM")


aggr(housing.data, 
     col=c('green', 'red'),
     numbers=T, sortVars=T, cex.axis=1.0, gap=2, ylab=c("Histograma de NAs", "Patrón"))




