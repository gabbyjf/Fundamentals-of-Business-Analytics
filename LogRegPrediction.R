options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Nonprofit.csv",header=TRUE)

n = length (d$donationbinary)

train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)

dtrn = d[train,]
dtst = d[test,]

fit = glm(dtrn$donationbinary ~ dtrn$age + dtrn$householdincome + dtrn$pctemployment + dtrn$householddependents,family="binomial")
summary(fit)

trnpred = round(fit$fitted,0)
trnactual = dtrn$donationbinary


k = fit$coef[1] + fit$coef[2]*dtst$age + fit$coef[3]*dtst$householdincome + fit$coef[4]*dtst$pctemployment + fit$coef[5]*dtst$householddependents
tstpred = exp(k)/(1+exp(k))
tstpred = round(tstpred,0)

tstactual = dtst$donationbinary

length(which(trnpred==0 & trnactual==0))
length(which(trnpred==1 & trnactual==1))
length(which(trnpred==0 & trnactual==1))
length(which(trnpred==1 & trnactual==0))

cfm = aggregate(trnpred,by=list(trnpred,trnactual),length)
colnames(cfm) = c("trnpred","trnactual","count")
cfm[,3] = cfm[,3]/sum(cfm[,3])

cfm2 = aggregate(tstpred,by=list(tstpred,tstactual),length)
colnames(cfm2) = c("tstpred","tstactual","count")
cfm2[,3] = cfm2[,3]/sum(cfm2[,3])


options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

largesalary = mat.or.vec(length(d$Salaries),1)
largesalary[which(d$Salaries>=10000000)] = 1
d = cbind(d,largesalary)

n = length (d$largesalary)
train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)
dtrn = d[train,]
dtst = d[test,]

fit = glm(dtrn$largesalary ~ dtrn$PTS +dtrn$G + dtrn$MP,family="binomial")
summary(fit)

k = fit$coef[1] + fit$coef[3]*dtst$G + fit$coef[4]*dtst$MP
tstpred = exp(k)/(1+exp(k))

trnactual = dtrn$largesalary
trnpred = round(fit$fitted,0)
tstactual = dtst$largesalary
tstpred = round(tstpred,0)

cfm1 = aggregate(trnpred,by=list(trnpred,trnactual),length)
colnames(cfm1) = c("trnpred","trnactual","count")
cfm1[,3] = cfm1[,3]/sum(cfm1[,3])

cfm2 = aggregate(tstpred,by=list(tstpred,tstactual),length)
colnames(cfm2) = c("tstpred","tstactual","count")
cfm2[,3] = cfm2[,3]/sum(cfm2[,3])

