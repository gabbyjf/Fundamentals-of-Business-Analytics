options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Nonprofit.csv",header=TRUE)

sample(1:9,3,replace=FALSE)

fit = lm (d$donationamount ~ d$educationlevel + d$yearsworking + d$gender)
summary(fit)

par(mfrow=c(2,2))
plot(d$educationlevel,d$donationamount)
plot(d$yearsworking,d$donationamount)
plot(d$gender,d$donationamount)
plot(fit$resid,fit$fitted)

fit = glm(d$donationbinary ~ d$educationlevel + d$yearsworking + d$gender, family="binomial")
summary(fit)

par(mfrow=c(2,2))
plot(d$educationlevel,d$donationbinary)
plot(d$yearsworking,d$donationbinary)
plot(d$gender,d$donationbinary)

