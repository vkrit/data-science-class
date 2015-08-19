w1 <- read.csv(file='w1.dat', sep=',', head=TRUE)
names(w1)
tree <- read.csv(file="trees91.csv",sep=",",head=TRUE)
names(tree)

stripchart(w1$vals, vertical=TRUE)
stripchart(w1$vals, vertical=TRUE, method="jitter")

stripchart(w1$vals, method='stack', main='Leaf BioMass in High CO2 Environment', xlab='BioMas of Leaves')

hist(w1$vals)
hist(w1$vals, main="Distribution of w1", xlab="w1")

boxplot(w1$vals)
boxplot(w1$vals, main='Leaf BioMass in High CO2 Environment', ylab='BioMass of Leaves')
boxplot(w1$vals, main='Leaf BioMass in High CO2 Environment', ylab='BioMass of Leaves', horizontal=TRUE)

plot(tree$STBM, tree$LFBM)

cor(tree$STBM, tree$LFBM)

plot(tree$STBM, tree$LFBM, main="Relationship Between Stem and Leaf Biomass", xlab="Stem Biomass", ylab="Leaf Biomass")

require(stats)
library(stats)

sleep
t.test(sleep[1:10,'extra'],sleep[11:20,'extra'])

m = matrix(1:40, 20, 20)
d = as.data.frame(m)
object.size(m)
object.size(d)


head(as.matrix(data.frame(a = factor(letters), B = factor(LETTERS))))
head(data.matrix(data.frame(a = factor(letters), B = factor(LETTERS))))



