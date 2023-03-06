options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

largesalary = mat.or.vec(length(d$Salaries),1)
largesalary[which(d$Salaries>=10000000)] = 1
d = cbind(d,largesalary)

fit = glm(d$largesalary ~ d$PTS + d$G +d$MP,family="binomial")
summary(fit)

cor(d$G,d$MP)

par(mfrow=c(4,4))
hist(d$Age)
hist(d$PTS)
hist(d$TOV)
hist(d$BLK)
hist(d$STL)
hist(d$TRB)
hist(d$FTA)
hist(d$FTPct)
hist(d$X2PPct)
hist(d$X3PPct)
hist(d$FGPct)
hist(d$MP)
hist(d$G)
hist(d$GS)
hist(d$PF)
hist(d$largesalary)

par(mfrow=c(1,2))
plot(d$G,d$largesalary)
plot(d$MP,d$largesalary)