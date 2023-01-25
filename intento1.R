install.packages("rgdal")
library(rgdal)
library(dplyr)
setwd("D:\\Users\\Hector de la Torre\\Documents\\Mapas\\")
datos_ags<-readOGR("01_aguascalientes\\conjunto_de_datos",layer="01a",encoding = "ISO-8859-1" )
plot(datos_ags)
plot(datos_jal[which(datos_ags$CVE_MUN=="001" & datos_ags$CVE_LOC=="0001"),])

head(datos_ags@data)
table(datos_ags@data$CVE_MUN,datos_ags@data$CVE_LOC)

#Leer info del Censo de Población y Vivienda 2022
datos_nac_censo<-read.csv("P:\\MMOP\\Git\\RESAGEBURB_02CSV20.csv")
