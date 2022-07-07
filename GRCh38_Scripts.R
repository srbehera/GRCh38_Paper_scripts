library(easyGgplot2)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(devtools)
library(reshape2)
library(ggpubr)

theme_set(
  theme_bw() +
    theme(legend.position = "top")
)

setwd("/Users/behera/GRCh38_bug/GRCh38_bug")

#Masked Mapping: Figure 2A 

data <- read.csv("duplicated_mapping_latest.csv", sep = "," , header = TRUE)
df1<-tibble(data)
head(df1)

colnames(df1) <- c("Gene", "Original mapping", "FixItFelix")
df1
print(df1)
dfm <- melt(df1[,c('Gene','Original mapping','FixItFelix')],id.vars = 1, variable.name='Mapping')
dfm
# bar plot
png(file="duplicated_mapping.png", height=1000, width=1500, res=150)
ggplot(dfm,aes(x = fct_inorder(Gene),y = value,color = Mapping)) + 
  geom_bar(aes(fill = Mapping),stat = "identity",position = "dodge") + 
  labs(title = "", x = "Gene(s)", y = "Average mapping quality") +
  theme(axis.text.x = element_text(angle = 120,  vjust = 0.5, hjust=1)) +
  theme(text = element_text(size = 20)) +
  theme(legend.position="top") 
dev.off()


#Collapsed mapping: Figure 2B
data <- read.csv("collapsed_mapping_latest.csv", sep = "," , header = TRUE)
df1<-tibble(data)
head(df1)

colnames(df1) <- c("Gene", "Original mapping", "FixItFelix")
df1
print(df1)
dfm <- melt(df1[,c('Gene','Original mapping','FixItFelix')],id.vars = 1, variable.name='Mapping')
dfm

# bar plot
png(file="collapsed_mapping.png", height=1500, width=1500, res=150)
ggplot(dfm,aes(x = fct_inorder(Gene),y = value,color = Mapping)) + 
  geom_bar(aes(fill = Mapping),stat = "identity",position = "dodge") + 
  labs(title = "", x = "Gene", y = "Average mapping quality") +
  theme(axis.text.x = element_text(angle = 90,  vjust = 0.5, hjust=1)) +
  theme(text = element_text(size = 25)) +
  theme(legend.position="top") 
dev.off()




#HG002_dipcall_duplicated_regionwise: Figure 3B
setwd("/Users/behera/GRCh38_bug/GRCh38_bug")
data <- read.csv("HG002_dipcall_collapsed_Fscore_latest.csv", sep = "," , header = TRUE)
df1<-tibble(data)
df1
class(data)
df1<-tibble(data)
df1

colnames(df1) <- c("Gene", "Original mapping", "FixItFelix")
df1
print(df1)
dfm <- melt(df1[,c('Gene','Original mapping','FixItFelix')],id.vars = 1, variable.name='Mapping')
dfm
png(file="duplicated_fscore_regionwise.png", height=1000, width=1500, res=150)
ggplot(data = dfm)+
  geom_point(aes(x = Gene, y = value, color=Mapping, shape=Mapping), size = 10) +
  labs(title = "", x = "Gene(s)", y = "F-measure", color="Mapping:", shape="Mapping:") +
  theme(axis.text.x = element_text(angle = 120,  vjust = 0.5, hjust=1)) +
  theme(text = element_text(size = 25)) +
  theme(legend.position="top") 
dev.off()

#HG002_dipcall_masked_regionwise: Figure 3B
setwd("/Users/behera/GRCh38_bug/GRCh38_bug")
data <- read.csv("HG002_dipcall_collapsed_Fscore_latest.csv", sep = "," , header = TRUE)
df1<-tibble(data)
df1
class(data)
df1<-tibble(data)
df1

colnames(df1) <- c("Gene", "Original mapping", "FixItFelix")
df1
print(df1)
dfm <- melt(df1[,c('Gene','Original mapping','FixItFelix')],id.vars = 1, variable.name='Mapping')
dfm
png(file="collapsed_fscore_regionwise.png", height=1000, width=1500, res=150)
ggplot(data = dfm)+
  geom_point(aes(x = Gene, y = value, color=Mapping, shape=Mapping), size = 10) +
  labs(title = "", x = "Gene", y = "F-measure", color="Mapping:", shape="Mapping:") +
  theme(axis.text.x = element_text(angle = 120,  vjust = 0.5, hjust=1)) +
  theme(text = element_text(size = 25)) +
  theme(legend.position="top") 
dev.off()

