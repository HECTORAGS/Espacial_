install.packages("rgdal")
library(rgdal)
library(dplyr)
setwd("D:\\Users\\Hector de la Torre\\Documents\\Mapas\\")
datos_jal<-readOGR("14_jalisco\\conjunto_de_datos",layer="14a",encoding = "ISO-8859-1" )
plot(datos_jal)
#dplyr::filter(datos_jal,CVE_MUN="074")
datos_jal@data
plot(datos_jal[which(datos_jal$CVE_MUN=="076"),])

