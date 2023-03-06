options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Employees.csv",header=TRUE)

sample(1:6,3,replace=FALSE)

fit = lm (d$currentsalary~d$levelofeducation)
summary(fit)

fit = lm (d$currentsalary~d$levelofeducation+d$yearsofservice+d$peerreviews)
summary(fit)

cor(cbind(levofeducation=d$levelofeducation,yrsofservice=d$yearsofservice,peerreviews=d$peerreviews))


w = d[which(d$technical==1),]

fit = lm (w$currentsalary~w$levelofeducation+w$yearsofservice+w$peerreviews)
summary(fit)



