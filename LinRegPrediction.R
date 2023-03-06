setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Packages.csv",header=TRUE)

n = length(d$year)

train = 1:(.7*n)
test = setdiff(1:n,train)

dtrn = d[train,]
dtst = d[test,]

fit = lm(dtrn$avghoursperdriver ~ dtrn$pctoversized)
summary(fit)

fit$resid
hist(fit$resid)

fit$coef[1] + fit$coef[2]*.0525

tstpred = fit$coef[1] + fit$coef[2]*dtst$pctoversized
tstresid = dtst$avghoursperdriver - tstpred

par(mfrow=c(1,2))
hist(fit$resid)
hist(tstresid)

d = read.csv ("Scores.csv",header=TRUE)

n = length(d$studentID)

train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)

dtrn = d[train,]
dtst = d[test,]


setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

n = length(d$Player)
train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)
dtrn = d[train,]
dtst = d[test,]

fit = lm (dtrn$PTS ~ dtrn$FGPct + dtrn$Salaries + dtrn$FTPct)
summary(fit)

tstpred = fit$coef[1] + fit$coef[2]*dtst$FGPct + fit$coef[3]*dtst$Salaries + fit$coef[4]*dtst$FTPct
tstresid = dtst$PTS - tstpred

par(mfrow=c(1,2))
hist(fit$resid)
hist(tstresid)

mean(abs(fit$resid))
mean(abs(tstresid),na.rm=TRUE)

