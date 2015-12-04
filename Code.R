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

install.packages('dplyr')
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

install.packages('car')
install.packages('MASS')
library(MASS)
Prestige <- read.csv(file="Prestige.csv")
plot(density(Prestige$income))
qqnorm(Prestige$income)
qqline(Prestige$income)
summary(boxcox(cbind(Prestige$income)))
transformdata <- box.cox(Prestige$income, 0.18)
plot(density(transformdata))
qqnorm(transformdata)
qqline(transformdata)

require('e1071')
?tune.svm
?svm

library('datasets')
iris
colnames(iris) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")

set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

install.packages('adabag')
library(adabag)
iris.adaboost <- boosting(Species~., data=trainData, boos=TRUE, mfinal=5)
iris.adaboost

?bagging

iris.bagging <- bagging(Species~., data=trainData, boos=TRUE, mfinal=5)

install.packages( c('rJava','RJSONIO', 'itertools', 'digest','Rcpp','httr','functional','devtools', 'plyr','reshape2')    

install.packages('randomForest')
library('randomForest')
?randomForest
model <- randomForest(Species~., data=trainData, nTree=500)
prediction <- predict(model, newdata=testData, type='class')
table(prediction, testData$Species)

iris.tr <- tree(Species ~ ., trainData)
str(iris.tr)
ncol(iris.tr)
?predict
table(predict(iris.tr), testData$Species) 
plot(print(iris.tr))
iris.cv <- cv.tree(iris.tr,, prune.tree)
for(i in 2:5)  iris.cv$dev <- iris.cv$dev +
    cv.tree(iris.tr,, prune.tree)$dev
iris.cv$dev <- iris.cv$dev/5
plot(iris.cv)

iris$versicolor <- factor(1*(iris$Species == 'versicolor'))
iris.rf <- ctree(versicolor ~ ., data=iris[,-5])
summary(predict(iris.rf, iris[,-5]))
summary(iris.preds <- predict(iris.rf, iris[,-5], type = 'prob'))
preds <- iris.preds[,2]
plot(performance(prediction(preds, iris$setosa), 'tpr', 'fpr'))

