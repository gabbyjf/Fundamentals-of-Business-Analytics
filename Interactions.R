options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Taxi.csv",header=TRUE)

n = length(d$fare)
train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)
dtrn = d[train,]
dtst = d[test,]

plot(d$tip, d$fare,pch=20,cex=.5)

plot(dtrn$tip[which(dtrn$credit==1)],dtrn$fare[which(dtrn$credit==1)],pch=20,cex=.8,col="blue")
points(dtrn$tip[which(dtrn$credit==0)],dtrn$fare[which(dtrn$credit==0)],pch=20,cex=.8,col="grey")

fit1 = lm(dtrn$fare[which(dtrn$credit==1)] ~ dtrn$tip[which(dtrn$credit==1)])
fit2 = lm(dtrn$fare[which(dtrn$credit==0)] ~ dtrn$tip[which(dtrn$credit==0)])

points(dtrn$tip[which(dtrn$credit==1)], fit1$fitted,pch=20,cex=.8,col="orange")
points(dtrn$tip[which(dtrn$credit==0)], fit2$fitted,pch=20,cex=.8,col="red")

fit3 = lm(dtrn$fare ~ dtrn$tip)
points(dtrn$tip,fit3$fitted,pch=20,cex=.8,col="green")

fit4 = lm(dtrn$fare ~ dtrn$tip + dtrn$credit)
points(dtrn$tip,fit4$fitted,pch=20,cex=.8,col="purple")

tcint = dtrn$tip*dtrn$credit
fit5 = lm(dtrn$fare ~ dtrn$tip + dtrn$credit + tcint)
summary(fit5)
points(dtrn$tip,fit5$fitted,pch=20,cex=.8,col="black")

options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

ar = d$Age*d$Ratings
ms = d$MP*d$Salaries
d = cbind(d,ar,ms)

n = length(d$Player)
train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)
dtrn = d[train,]
dtst = d[test,]

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$MP + dtrn$ar + dtrn$ms)
summary(fit)


