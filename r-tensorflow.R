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
model %>%
  layer_dense(units = 256, activation = 'relu', input_shape = c(784)) %>%
  layer_dropout(rate = 0.4) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dropout(rate = 0.3) %>%
  layer_dense(units = 10, activation = 'softmax')
summary(model)
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = optimizer_rmsprop(),
  metrics = c('accuracy')
)
history <- model %>% fit(
  x_train, y_train,
  epochs = 30, batch_size = 128,
  validation_split = 0.2
)
plot(history)
model %>% evaluate(x_test, y_test)
model %>% predict_classes(x_test)
library(keras)
max_features = 20000
maxlen = 100
embedding_size = 128
kernel_size = 5
filters = 64
pool_size = 4
lstm_output_size = 70
batch_size = 30
epochs = 2
imdb <- dataset_imdb(num_words = max_features)
x_train <- imdb$train$x %>%
  pad_sequences(maxlen = maxlen)
x_test <- imdb$test$x %>%
  pad_sequences(maxlen = maxlen)
model <- keras_model_sequential()
model %>%
  layer_embedding(max_features, embedding_size, input_length = maxlen) %>%
  layer_dropout(0.25) %>%
  layer_conv_1d(
    filters,
    kernel_size,
    padding = "valid",
    activation = "relu",
    strides = 1
  ) %>%
  layer_max_pooling_1d(pool_size) %>%
  layer_lstm(lstm_output_size) %>%
  layer_dense(1) %>%
  layer_activation("sigmoid")
model %>% compile(
  loss = "binary_crossentropy",
  optimizer = "adam",
  metrics = "accuracy"
)
model %>% fit(
  x_train, imdb$train$y,
  batch_size = batch_size,
  epochs = epochs,
  validation_data = list(x_test, imdb$test$y)