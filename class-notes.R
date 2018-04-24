setwd('~/dev/Teaching/DataScience/data-science-class/')
titanic <- read.table("titanic-train.csv", 
                      sep=",", header=TRUE)
titanic
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)

library(e1071)
titaticfix <- impute(titanic[,6:8], what="median")
titanic$Age <- titaticfix[,1]
titanic$SibSp <- titaticfix[,2]
set.seed(888)
index <- sample(2, length(titanic), 
                replace = TRUE, prob = c(0.7,0.3))
trainData <- titanic[index==1,]
testData <- titanic[index==2,]
library(party)

?ctree

myFormula <- Survived ~ Pclass + Sex + Age + SibSp + Parch
titatic_ctree <- ctree(myFormula, data=trainData)

# check the prediction
table(predict(titatic_ctree), trainData$Survived)
plot(titatic_ctree, type="simple")

test.pred <- predict(titatic_ctree, newdata=testData)
table(test.pred, testData$Survived)

library(caret)
confusionMatrix(test.pred, testData$Survived)
tune <- tune.svm(myFormula, data=trainData, gamma=10^(-6:-1), cost=10^(1:4))
summary(tune)
model <-svm(myFormula, data=trainData, method="C-Classification",
            kernel="radial", probability=T, gamma=0.1, cost=10)
prediction <- predict(model, testData, probability=T)
table(testData$Survived, prediction)
confusionMatrix(prediction, testData$Survived)
