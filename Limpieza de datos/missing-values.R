data <- read.csv("../r-course-master/data/tema1/missing-data.csv",na.strings = "")

data.cleaned <- na.omit(data)


is.na(data[4,2])
is.na(data[4,1])
is.na(data$Income)

#Limpiamos los NA de la variable Income
data.income.cleaned <- data[!is.na(data$Income),]
#Filas completas para un DF
complete.cases(data)
data.cleaned.2 <- data[complete.cases(data),]
#Convertir los ceros de ingresos en NA's
data$Income[data$Income==0] <- NA

#Medidas de centralización y dispersión.
mean(data$Income)
#Con los missing values
mean(data$Income,na.rm=T)
#desviación estandar
sd(data$Income)
#Con los missing values
sd(data$Income,na.rm=T)
