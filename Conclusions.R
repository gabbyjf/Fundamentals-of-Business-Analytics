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

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$MP + dtrn$ms)
summary(fit)

tstpred = fit$coef[1] + fit$coef[2]*dtst$Ratings + fit$coef[3]*dtst$MP + fit$coef[4]*dtst$ms
tstresid = dtst$PTS - tstpred

par(mfrow=c(1,2))
hist(fit$resid)
hist(tstresid)

mean(abs(fit$resid))
mean(abs(tstresid))