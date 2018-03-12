library(ggplot2)
library(RColorBrewer)
Artists <- read.csv("G:/Python/Blog/Xiami/Art.csv", header=FALSE)
colnames(Artists) <- c("image","url","artist","country")
Artists[] <- lapply(Artists, as.character)
Artists$country[Artists$country=="欧美"] <- "Western"
Artists$country<- gsub("[\u4e00-\u9fa5]","",Artists$country)
Artists$country<- gsub("^ | $","",Artists$country)
# Artists$country[Artists$country==""] <- NA
# Artists[is.na(Artists$country),]
Artists$country[Artists$country=="United States of America"] <- "USA"
table(Artists$country)

Artists[Artists$country=="Japan",]$artist

ggplot(Artists) + geom_bar(aes(x=country,fill=country)) + 
                  theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) +
                  coord_flip() + scale_fill_brewer(palette = "Paired")+ guides(fill=FALSE)


ggplot(Artists[Artists$country!="China",]) + geom_bar(aes(x=country,fill=country)) + 
  theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) +
  coord_flip() + scale_fill_brewer(palette = "Paired") + guides(fill=FALSE)
