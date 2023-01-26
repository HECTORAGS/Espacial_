install.packages("rgdal")
library(rgdal)
library(dplyr)
setwd("D:\\Users\\Hector de la Torre\\Documents\\Mapas\\")
datos_ags<-readOGR("01_aguascalientes\\conjunto_de_datos",layer="01a",encoding = "ISO-8859-1" )
datos_ags2<-datos_jal[which(datos_ags$CVE_MUN=="001" & datos_ags$CVE_LOC=="0001" ),]

#Leer info del Censo de Población y Vivienda 2022
datos_nac_censo<-read.csv("P:\\MMOP\\Git\\RESAGEBURB_01CSV20.csv")
head(datos_nac_censo)
datos_ageb_ags<-datos_nac_censo[which(datos_nac_censo$MUN=="1" & datos_nac_censo$LOC=="1"  & datos_nac_censo$AGEB!="0000" & datos_nac_censo$MZA=="0"),]
dim(datos_ageb_ags)

pro_fem<-as.numeric(datos_ageb_ags$POBFEM)/as.numeric(datos_ageb_ags$POBTOT)
summary(pro_fem)

#install.packages("Hmisc")
library(Hmisc)
cate_prop_fem<-data.frame(AGEB=datos_ageb_ags$AGEB,PROP_FEM=as.factor(cut2(pro_fem,g=4)),FEM=pro_fem)

empate<-base::merge(x=datos_ags2@data,y=cate_prop_fem,by.x="CVE_AGEB",by.y="AGEB",all.x=TRUE,sort=FALSE)

datos_ags2@data$PROP_FEM<-empate$PROP_FEM
datos_ags2@data$FEM<-empate$FEM