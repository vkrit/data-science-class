library(class)

?knn
install.packages("dplyr")
library(dplyr)

?subset
tinew<-select(titanic_train,
              Survived,Pclass,Age,Sex )

tinew1<-subset(titanic_train, 
              select=c(Survived,Pclass,Age,Sex) )
tinew
tinew1
cat <- levels(tinew$Sex)
binarize <- function(x) {return(tinew$Sex == x)}
newcols <- sapply(cat, binarize)
colnames(newcols) <- cat
data <- cbind(tinew[,c('Sex')], newcols)
data
tinew2 <-merge(tinew[,1:3],data[,2:3])
tinew2
train_input <- as.matrix(trainData[,-5])
train_output <- as.vector(trainData[,5])
test_input <- as.matrix(testData[,-5])

trainData  titanic_train
prediction <- knn(train_input, test_input, 
                    train_output, k=5)
table(prediction, testData$Species)
