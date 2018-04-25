library(nnet)
library(caret)
library(NeuralNetTools)

# Create Neural Network Model
nn <- nnet(Species~., data=trainData, size=3, maxit=500)
  
# summarize the fit
summary(nn)
library(devtools)
source_url('https://goo.gl/qB3rHg')
plot.nnet(nn, pid=F)
# make predictions
predictions <- predict(nn, testData[,1:4], type="class")
# summarize accuracy
table(predictions, testData$Species)
confusionMatrix(predictions, testData$Species)