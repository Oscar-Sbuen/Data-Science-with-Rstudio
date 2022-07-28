install.packages("tidyr")


crime.data <- read.csv("../r-course-master/data/tema1/USArrests.csv", stringsAsFactors = F)

crime.data <- cbind(state=row.names(crime.data), crime.data)


#gather sirve para unir un data frame con valores clave.
crime.data.1 <- gather(crime.data, 
                       key="crime_type", value = "arrested_estimate", Murder: UrbanPop) 


crime.data.2 <- gather(crime.data, key="crime_type", value="arrest_estimate",
                       -state)

crime.data.3 <- gather(crime.data,
                       key="crime_type",
                       value="arrest_estimate", Murder, Assault)


crime.data.4 <- spread(crime.data.2, 
                       key="crime_type",
                       value = "arrest_estimate")

#united se utiliza para juntar información de dos columnas en una

crime.data.5 <- unite(crime.data, 
                      col="Murder_Assault",
                      Murder, Assault,
                      sep="_")

#separate sirve para separar una columna en dos
crime.data.6 <- separate(crime.data.5, col="Murder_Assault", into = c("Murder", "Assault"), sep="_")








