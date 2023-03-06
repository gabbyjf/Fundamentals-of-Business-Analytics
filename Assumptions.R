options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Packages.csv",header=TRUE)

fit = lm (d$avghoursperdriver~d$pctoversized)
summary(fit)

fit$resid[1:10]

plot(fit$resid)

plot(fit$resid,pch=20,cex=.6)

acf(fit$resid)

fit$fitted[1:10]

plot(fit$resid,fit$fitted,pch=20,cex=.6)

hist(d$avghoursperdriver)
hist(fit$resid)

qqnorm(d$avghoursperdriver)
qqline(d$avghoursperdriver)

qqnorm(fit$resid)
qqline(fit$resid)


options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

fit = lm (d$PTS~d$FGPct+d$Salaries+d$FTPct)
summary(fit)

plot(fit$resid,pch=20,cex=.6)
acf(fit$resid)

par(mfrow=c(2,2))
plot(d$FGPct,d$PTS)
plot(d$Salaries,d$PTS)
plot(d$FTPct,d$PTS)
plot(fit$resid,fit$fitted)

par(mfrow=c(2,2))
hist(d$PTS)
hist(fit$resid)
qqnorm(d$PTS)
qqline(d$PTS)
qqnorm(fit$resid)
qqline(fit$resid)