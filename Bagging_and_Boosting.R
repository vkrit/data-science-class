library(randomForest)

model <- randomForest(iris[,-5], iris[,5], ntree=10)
prediction <- predict(model, newdata = testData, type='class')
table(prediction, testData$Species)
plot(model)
model
getTree(model, 1, labelVar=TRUE)
getTree(model, 3, labelVar=TRUE)
