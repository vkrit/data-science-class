# installation
install.packages("devtools")
devtools::install_github("rstudio/keras")
library(keras)
install_tensorflow()
install_tensorflow(gpu=TRUE)

#Below is the list of models that can be built in R using Keras.

#Multi-Layer Perceptrons
#Convoluted Neural Networks
#Recurrent Neural Networks
#Skip-Gram Models
#Use pre-trained models like VGG16, RESNET etc.
#Fine-tune the pre-trained models.

# TensorFlow
#
reticulate::use_condaenv(condaenv="r-tensorflow", conda="/Users/kris/anaconda3/anaconda/bin/conda", required=TRUE)
library(tensorflow)
library(keras)
sess = tf$Session()
hello <- tf$constant('Hello, TensorFlow!')
sess$run(hello)

# Install keras
#install_keras(method="conda", conda="/Users/kris/anaconda3/anaconda/bin/conda")
#library(keras)
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y
# reshape
dim(x_train) <- c(nrow(x_train), 784)
dim(x_test) <- c(nrow(x_test), 784)
# rescale
x_train <- x_train / 255
x_test <- x_test / 255
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)
model <- keras_model_sequential()

#defining the model with 1 input layer[784 neurons], 
#    1 hidden layer[784 neurons] with dropout rate 0.4 
#     and 1 output layer[10 neurons]
#i.e number of digits from 0 to 9

model %>%
  layer_dense(units = 784, activation = 'relu', input_shape = c(784)) %>%
  layer_dropout(rate = 0.4) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dropout(rate = 0.3) %>%
  layer_dense(units = 10, activation = 'softmax')
summary(model)

#compiling the defined model with metric = accuracy 
# and optimiser as adam
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = 'adam',
  metrics = c('accuracy')
)
#fitting the model on the training dataset
history <- model %>% fit(
  x_train, y_train,
  epochs = 30, batch_size = 128,
  validation_split = 0.2
)
#plot model running
plot(history)

#Evaluating model on the cross validation dataset
loss_and_metrics <- model %>% evaluate(x_test, y_test, batch_size = 128)
testprd <- model %>% predict_classes(x_test)


