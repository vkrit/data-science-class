<<<<<<< HEAD
data(ROCR.hiv)
attach(ROCR.hiv)
pred.svm <- prediction(hiv.svm$predictions, hiv.svm$labels)
perf.svm <- performance(pred.svm, "tpr", "fpr")
pred.nn <- prediction(hiv.nn$predictions, hiv.svm$labels)
perf.nn <- performance(pred.nn, "tpr", "fpr")
plot(perf.svm, lty=3, col="red",main="SVMs and NNs for prediction of
     HIV-1 coreceptor usage")
plot(perf.nn, lty=3, col="blue",add=TRUE)
plot(perf.svm, avg="vertical", lwd=3, col="red",
     spread.estimate="stderror",plotCI.lwd=2,add=TRUE)
plot(perf.nn, avg="vertical", lwd=3, col="blue",
     spread.estimate="stderror",plotCI.lwd=2,add=TRUE)
legend(0.6,0.6,c(’SVM’,’NN’),col=c(’red’,’blue’),lwd=3)
=======
install.packages("ROCR")
install.packages("klaR")
library(ROCR)
library(klaR)

data(iris)

lvls = levels(iris$Species)
testidx = which(1:length(iris[, 1]) %% 5 == 0) 
iris.train = iris[testidx, ]
iris.test = iris[-testidx, ]

aucs = c()
plot(x=NA, y=NA, xlim=c(0,1), ylim=c(0,1),
     ylab='True Positive Rate',
     xlab='False Positive Rate',
     bty='n')

for (type.id in 1:3) {
  type = as.factor(iris.train$Species == lvls[type.id])
  
  nbmodel = NaiveBayes(type ~ ., data=iris.train[, -5])
  nbprediction = predict(nbmodel, iris.test[,-5], type='raw')
  
  score = nbprediction$posterior[, 'TRUE']
  actual.class = iris.test$Species == lvls[type.id]
  
  pred = prediction(score, actual.class)
  nbperf = performance(pred, "tpr", "fpr")
  
  roc.x = unlist(nbperf@x.values)
  roc.y = unlist(nbperf@y.values)
  lines(roc.y ~ roc.x, col=type.id+1, lwd=2)
  
  nbauc = performance(pred, "auc")
  nbauc = unlist(slot(nbauc, "y.values"))
  aucs[type.id] = nbauc
}

lines(x=c(0,1), c(0,1))

mean(aucs)
>>>>>>> 73782b28f91fc12131d96020fb7112028360f75c
