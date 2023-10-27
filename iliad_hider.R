#install.packages("devtools")
#library(devtools)

#devtools::install_github("richfitz/stegasaur")

library(stegasaur)
library(tidyverse)
library(ggthemes)
library(png)

mtcars

ggplot(mtcars) +
geom_point(aes(x=disp,y=mpg,size=wt*1000,color = qsec))+
  labs(title="Displacement vs MPG",
       subtitle = "Circle Size Indicates Vehicle Weight, Color indicates quarter mile time")+
  theme_fivethirtyeight()+
  theme(legend.title = element_blank()) 

ggsave(filename = "graph.jpg",height = 4, width = 6, units = "in") 

graph <- "graph.jpg"

msg <- "The wrath sing, goddess, of Peleus' son, Achilles, that destructive wrath which brought countless woes upon the Achaeans, and sent forth to Hades many valiant souls of heroes..."

stegasaur::encode(msg,
                  graph,
                  "graph2.png")

msg2 <- stegasaur::decode("graph2.png")

print(msg2)