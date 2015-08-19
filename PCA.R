pca <- prcomp(iris[,-5], scale=T)
summary(pca)
biplot(pca)

library(devtools)
install_github("ggbiplot", "vqv")

library(ggbiplot)
g <- ggbiplot(pca, obs.scale = 1, var.scale = 1, groups = iris$Species, ellipse = TRUE, circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal',  legend.position = 'top')
print(g)
