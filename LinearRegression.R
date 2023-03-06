setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

dim(d)
d[1,]

fit = lm (d$PTS~d$FGPct)

options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

d[1,]
unique(d$Age)

options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

youngage = mat.or.vec(length(d$Age),1)
youngage[which(d$Age <= 28)] = 1

options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

youngage = mat.or.vec(length(d$Age),1)
youngage[which(d$Age <= 28)] = 1
d = cbind(d,youngage)

fit = lm(d$PTS~d$youngage)

hist(d$PTS)
hist(d$FGPct)

options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

fit = lm (d$PTS~d$FGPct+d$Salaries+d$FTPct)
fit = lm (d$PTS~d$FGPct)

fit = lm (d$Salaries~d$PTS+d$FGPct)
summary(fit)
fit = lm (d$Salaries~d$PTS+d$AST+d$TRB)
summary(fit)