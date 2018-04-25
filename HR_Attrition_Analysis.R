hremployee <- read.csv("WA_Fn-UseC_-HR-Employee-Attrition.csv", 
                       header=TRUE)

library(fifer)
yeshr <- stratified(hremployee, "Attrition", 200, 
           select = list(Attrition = c("Yes")))
nohr <- stratified(hremployee, "Attrition", 200, 
                    select = list(Attrition = c("No")))
hrsample <- rbind(yeshr,nohr)

set.seed(1234)
ind <- sample(2, nrow(hrsample), replace=TRUE, 
              prob=c(0.6,0.4))
trainData <- hrsample[ind==1,]
testData <- hrsample[ind==2,]
str(hrsample)
table(hrsample$JobSatisfaction)
hist(hrsample$Age)
hist(hrsample$PerformanceRating)
hist(hrsample$DistanceFromHome)
hist(hrsample$WorkLifeBalance)
hist(hrsample$YearsAtCompany)
myformula <- Attrition ~ JobSatisfaction + 
                        Age + PerformanceRating +
                        DistanceFromHome + 
                        WorkLifeBalance + 
                        YearsAtCompany
table(trainData$Attrition)
table(testData$Attrition)
library(party)
ctree_model <- ctree(myformula, data=trainData)
plot(ctree_model)
table(predict(ctree_model,newdata=testData), 
      testData$Attrition)
