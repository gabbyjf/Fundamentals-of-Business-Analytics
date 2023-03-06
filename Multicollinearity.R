options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Taxi.csv",header=TRUE)

cor(cbind(dist=d$distance,dur=d$duration,cred=d$credit))

options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

cor(d$Salaries,d$PTS)
cor(d$PTS,d$FGPct,use="pairwise")

cor(cbind(FGPct=d$FGPct,Salaries=d$Salaries,FTPct=d$FTPct),use="pairwise")

fit = lm (d$PTS~d$MP+d$Salaries+d$FGPct)
summary(fit)

fit = lm (d$PTS~)

cor(cbind(Salaries=d$Salaries,G=d$G,MP=d$MP,use="pairwise"))

class(d$MP)
class(d$Salaries)
class(d$FGPct)

cor(cbind(Age=d$Age,PTS=d$PTS,d$FGPct,use="pairwise"))