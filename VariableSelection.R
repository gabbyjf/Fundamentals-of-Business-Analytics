options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

n = length(d$Player)
train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)
dtrn = d[train,]
dtst = d[test,]

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Salaries + dtrn$Age + dtrn$G + dtrn$MP + dtrn$FGPct + dtrn$FTPct + dtrn$AST + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$G + dtrn$MP + dtrn$FGPct + dtrn$AST + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$G + dtrn$MP + dtrn$AST + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Age + dtrn$G + dtrn$MP + dtrn$AST + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$G + dtrn$MP + dtrn$AST + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$MP + dtrn$AST + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$G + dtrn$AST + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$G + dtrn$MP + dtrn$STL)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$G + dtrn$MP + dtrn$AST)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$MP)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Age + dtrn$MP)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$MP)
summary(fit)

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age)
summary(fit)


