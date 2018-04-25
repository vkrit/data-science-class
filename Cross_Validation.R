
# load the libraries
library(caret)
library(klaR)
# load the iris dataset
data(iris)
# define an 80%/20% train/test split of the dataset
split=0.70
trainIndex <- createDataPartition(iris$Species, p=split, list=FALSE)
data_train <- iris[ trainIndex,]
data_test <- iris[-trainIndex,]
# train a naive bayes model
model <- NaiveBayes(Species~., data=data_train)
# make predictions
x_test <- data_test[,1:4]
y_test <- data_test[,5]
predictions <- predict(model, x_test)
# summarize results
confusionMatrix(predictions$class, y_test)


# Bootstrap

# load the library
library(caret)
# load the iris dataset
data(iris)
# define training control
train_control <- trainControl(method="boot", number=100)
# train the model
model <- train(Species~., data=data_train, trControl=train_control, method="nb")
# summarize results
print(model)
predictions <- predict(model, x_test)
# summarize results
confusionMatrix(predictions, y_test)
# k-fold Cross Validation

# load the library
library(caret)
# load the iris dataset
data(iris)
# define training control
train_control <- trainControl(method="cv", number=10)
# fix the parameters of the algorithm
#grid <- expand.grid(.fL=c(0), .usekernel=c(FALSE))
# train the model
#model <- train(Species~., data=data_train, trControl=train_control, method="nb", tuneGrid=grid)
model <- train(Species~., data=data_train, trControl=train_control, method="nb")
# summarize results
print(model)
predictions <- predict(model, x_test)
# summarize results
confusionMatrix(predictions, y_test)

# Repeat K-Fold 
# load the library
library(caret)
# load the iris dataset
data(iris)
# define training control
train_control <- trainControl(method="repeatedcv", number=10, repeats=3)
# train the model
model <- train(Species~., data=data_train, trControl=train_control, method="nb")
# summarize results
print(model)
predictions <- predict(model, x_test)
# summarize results
confusionMatrix(predictions, y_test)
# Leave one out Cross Validation
# load the library
library(caret)
# load the iris dataset
data(iris)
# define training control
train_control <- trainControl(method="LOOCV")
# train the model
model <- train(Species~., data=data_train, trControl=train_control, method="nb")
# summarize results
print(model)
predictions <- predict(model, x_test)
# summarize results
confusionMatrix(predictions, y_test)
