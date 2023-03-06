options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

dim(d)
d[1,]

w = d[which(d$Salaries>5000000),]
dim(w)
mean(w$PTS)
mean(w$Salaries)
mean(w$G)
unique(w)

largesalary = d[which(d$Salaries>15000000),]
dim(largesalary)
mean(largesalary$PTS)
mean(largesalary$Salaries)
mean(largesalary$G)
mean(largesalary$MP)
 
