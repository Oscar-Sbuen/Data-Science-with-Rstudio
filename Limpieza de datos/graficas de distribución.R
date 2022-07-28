x<-c(61,33,35,74,48,53,53,48,23,19,15,57,72,40,27,25,75,66,34,27,38,16,42,57,27,59,37,63,71,48)

#Debera instalar el paquete que vamos a llamar
library(fdth) # carga la extensión fdth (para el calculo de distribución de frecuencias.

dist <- fdt(x,breaks="Sturges") # calcula la distribución de frecuencias utilizando la regla Sturge

#Donde
#f= frecuencia absoluta
#rf= frecuencia relativa
#rf(%) frecuencia relativa porcentual
#cf= frecuencia acumulada
#cf(%)=frecuencia acumulada porcentual

par(mfrow=c(2,1)) # particiona mi ventana grafica en 3x2.
hist(x, breaks = 30) #histograma utilizando el numero de clases según Sturge

plot(dist, type="cfh")   #histograma de frecuencias acumulada
plot(dist, type="cfp")   #poligono de frecuencias acumulado

## Beta FOREX


####  #######

#install.packages("quantmod")
library(quantmod)
#install.packages("tseries")
library(tseries)
#install.packages("fImport")
library(fImport)
# DESCARGA DE DATOS
# UTILIZAMOS 2 DIVISAS

#getFX("EUR/USD")
#getFX("GBP/USD")
#getFX("USD/CHF")
#getFX("AUD/USD")

#DATOS FRED

GBPUSD<-fredSeries("DEXUSUK",from="2010-01-01",to="2019-10-23")
USDCHF<-fredSeries("DEXSZUS",from="2010-01-01",to="2019-10-23")
EURUSD<-fredSeries("DEXUSEU",from="2010-01-01",to="2019-10-23") 


# Regresión Lineal para sacar betas

# 1 Hacemos los logaritmos de las series

#y = log(EURUSD)
#x = log(GBPUSD)

y= diff(log(EURUSD )) #variable dependiente
x= diff(log(GBPUSD))  #regresor o independiente

plot(EURUSD,type="l")
plot(GBPUSD,type="l")

library(tseries)

## REGRESION PARA 2 ACTIVOS 

modelo=lm(y~x)  # regresión lineal
modelo
summary(modelo)

# Beta = Pendiente del modelo

beta=coef(modelo)
beta

















