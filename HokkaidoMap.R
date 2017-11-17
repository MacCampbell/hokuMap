library(raster)
library(ggplot2)
library(maps)
library(mapdata)
library(manipulate)
library(lubridate)
library(rgdal)
library(raster)

japan<-map_data("japan")
hokkaido<-subset(japan, region %in% "Hokkaido")

#Read in the streams data
polyStreams<-readOGR("/Users/mac/Dropbox/Hokkaido/hokumap/gm-jpn-hydro_u_2/riverl_jpn.shp","riverl_jpn")
polyStreamsdf<-fortify(polyStreams)
#itou<-subset(polyStreams, nam %in% c("KOETOI G.","SARUFUTSU G.", "BEKANBEUSHI G.",
#                                     "SHIRIBETSU G.","ONO G."))
#itouDf<-fortify(itou)

ggplot() + 
  xlim(138, 150)+ylim(41,46)+
  geom_polygon(data = hokkaido, aes(x=long, y = lat, group = group), fill = NA, color = "black") + 
  coord_fixed(1.3)+
  geom_path(data = polyStreamsdf, 
            aes(x = long, y = lat, group = group),
            color = 'black', size = .3)+
 # geom_path(data = itouDf, 
  #          aes(x = long, y = lat, group = group),
   #         color = 'blue', size = .3)+
  xlab("Longitude")+
  ylab("Latitude")+
  theme_classic()+
  theme(axis.text=element_text(size=10, family="Times"),
        axis.title=element_text(size=12, face="bold", family="Times"))


###For Tetsu the shishamo area. 

ggplot() + 
 # xlim(141.66, 142.33)+ylim(42, 42)+
  geom_polygon(data = hokkaido, aes(x=long, y = lat, group = group), fill = NA, color = "black") + 
  coord_fixed(1.3)+
  geom_path(data = polyStreamsdf, 
            aes(x = long, y = lat, group = group),
            color = 'black', size = .3)+
  # geom_path(data = itouDf, 
  #          aes(x = long, y = lat, group = group),
  #         color = 'blue', size = .3)+
  xlab("Longitude")+
  ylab("Latitude")+
  theme_classic()+
  theme(axis.text=element_text(size=10, family="Times"),
        axis.title=element_text(size=12, face="bold", family="Times"))+
  coord_fixed(xlim = c(141.66, 142.33), ylim = c(42, 43))

