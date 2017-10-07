height <- c(180, 165, 160, 193)
weight <- c(87, 58, 65, 100)

bmi <- weight / (height /100)^2

logbmi <- log(bmi)
bmimorethan25 <- bmi[bmi > 25]

height
weight
bmi
logbmi
bmimorethan25

read.csv(file.choose(), sep = ",") = iris
read.csv(file.choose(), sep = ",") -> iris

cherry <- read.csv(file.choose(), dec=".", sep=",")
cherry <- read.csv("~/Downloads/cherry.csv", dec=".", sep=",")
?read.csv
