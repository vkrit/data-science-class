install.packages('neuralnet')

library(neuralnet)

?neuralnet

iris <- read.csv("iris.data.csv", header=TRUE)
# Prepare iris
set.seed(567)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
ttrainData <- iris[ind==1,]
ttestData <- iris[ind==2,]

nnet_iristrain <- ttrainData

#Binarize the categorical output
<<<<<<< HEAD
nnet_iristrain <- cbind(nnet_iristrain, trainData$Species == 'Iris-setosa')
nnet_iristrain <- cbind(nnet_iristrain, trainData$Species == 'Iris-versicolor')
nnet_iristrain <- cbind(nnet_iristrain, trainData$Species == 'Iris-virginica')
=======
nnet_iristrain <- cbind(nnet_iristrain, ttrainData$Species == 'Iris-setosa')
nnet_iristrain <- cbind(nnet_iristrain, ttrainData$Species == 'Iris-versicolor')
nnet_iristrain <- cbind(nnet_iristrain, ttrainData$Species == 'Iris-virginica')
>>>>>>> 73782b28f91fc12131d96020fb7112028360f75c
names(nnet_iristrain)[6] <- 'setosa'
names(nnet_iristrain)[7] <- 'versicolor'
names(nnet_iristrain)[8] <- 'virginica'

<<<<<<< HEAD
nn <- neuralnet(setosa+versicolor+virginica
                ~ Sepal.Length+Sepal.Width+
                  Petal.Length+Petal.Width,
                data=nnet_iristrain,
                hidden=c(5))

plot(nn)

mypredict <- compute(nn, testData[-5])$net.result
=======
nn <- neuralnet(setosa+versicolor+virginica ~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, 
                data=nnet_iristrain, hidden=c(3))

plot(nn)
mypredict <- compute(nn, ttestData[-5])$net.result
>>>>>>> 73782b28f91fc12131d96020fb7112028360f75c

# Put multiple binary output to categorical output
maxidx <- function(arr) {
  return(which(arr == max(arr)))
}
idx <- apply(mypredict, c(1), maxidx)
<<<<<<< HEAD
prediction <- c('Iris-setosa', 'Iris-versicolor', 'Iris-virginica')[idx]
table(prediction, testData$Species)
library(caret)
confusionMatrix(prediction, testData$Species)

if (require(caret)==FALSE) {
  install.packages("caret")
  library(caret)
}

=======
prediction <- c('setosa', 'versicolor', 'virginica')[idx]
table(prediction, ttestData$Species)
>>>>>>> 73782b28f91fc12131d96020fb7112028360f75c
