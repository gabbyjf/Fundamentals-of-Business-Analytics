options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Employees.csv",header=TRUE)

sample(1:7,4,replace=FALSE)

## variables: technical, leadershiplevel, performancereview, peerreviews

q = quantile(d$currentsalary,c(.01,.99))

q[1]
q[2]

w = d[-which(d$currentsalary < q[1]),]
w = d[-which(d$currentsalary > q[2]),]

tl = w$technical*w$leadershiplevel
pp = w$performancereview*w$peerreviews
w = cbind(w,tl,pp)

n = length(w$technical)
train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)
wtrn = w[train,]
wtst = w[test,]

fit = lm(wtrn$currentsalary ~ wtrn$technical + wtrn$leadershiplevel + wtrn$performancereview + wtrn$peerreviews)
summary(fit)

fit = lm(wtrn$currentsalary ~ wtrn$leadershiplevel + wtrn$performancereview + wtrn$peerreviews)
summary(fit)

fit = lm(wtrn$currentsalary ~ wtrn$technical + wtrn$performancereview + wtrn$peerreviews)
summary(fit)

fit = lm(wtrn$currentsalary ~ wtrn$technical + wtrn$leadershiplevel + wtrn$peerreviews)
summary(fit)

fit = lm(wtrn$currentsalary ~ wtrn$technical + wtrn$leadershiplevel + wtrn$performancereview)
summary(fit)

## interaction model

fit = lm(wtrn$currentsalary ~ wtrn$technical + wtrn$leadershiplevel + wtrn$performancereview + wtrn$peerreviews + wtrn$tl)
summary(fit)

fit = lm(wtrn$currentsalary ~ wtrn$technical + wtrn$leadershiplevel + wtrn$performancereview + wtrn$peerreviews + wtrn$pp)
summary(fit)

fit = lm(wtrn$currentsalary ~ wtrn$technical + wtrn$leadershiplevel + wtrn$performancereview)
summary(fit)

## test predictions

tstpred = fit$coef[1] + fit$coef[2]*wtst$technical + fit$coef[3]*wtst$leadershiplevel + fit$coef[4]*wtst$performancereview
tstresid = wtst$currentsalary - tstpred

par(mfrow=c(1,2))
hist(fit$resid)
hist(tstresid)

mean(abs(fit$resid))
mean(abs(tstresid))
