set.seed(101)
sampleiris <- iris[sample(1:150, 40),] # get samples from iris dataset
# each observation has 4 variables, ie, they are interpreted as 4-D points
distance   <- dist(sampleiris[,-5], method="euclidean") 
cluster    <- hclust(distance, method="average")
plot(cluster, hang=-1, type = "triangle", label=sampleiris$Species)

library(dendextend)
library(dplyr)
library(ggplot2)
dend <- cluster %>% as.dendrogram

dend %>% set("nodes_pch", 19) %>%  # node point type
  set("nodes_cex", 0.5) %>%  # node point size
  set("nodes_col", "blue") %>% 
  set("labels", 1:40) %>% 
  set("labels_col", c("blue")) %>%
  plot(main = "Dendrogram of Species in iris")

dend %>% set("labels", sampleiris$Species) %>%
    plot(type = "triangle")



