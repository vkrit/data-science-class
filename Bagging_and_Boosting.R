library(randomForest)
library(reprtree)
model <- randomForest(Species~.,
                      data=trainData,
                      keep.forest=FALSE,
                      nTree=500)
prediction <- predict(model, newdata = testData, type='class')
table(prediction, testData$Species)
plot(model)
model
