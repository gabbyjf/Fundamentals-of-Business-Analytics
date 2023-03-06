

6 + 3

1 - 2

a = 6
a
a + 4
a = 3

b = 3+8
b

a + b

a / b  ## division

## Video 4

d = c(1,2,3,4,6)
d
e = c(10,12,-1,0)

names = c("prices","dates", "times")

d[3]
d[5]

d[4:5]

## Matrices

t = matrix(c(1,2,3,4,5,6,7,8,10,12,14,15),4,3)

t[4,2]
t[4,2:3]
t[3:4,2:3]
t[1,]
t[,3]


## Operations on Lists & Matrices

d = c(1,2,3,4,6)
t = matrix(c(1,2,3,4,5,6,7,8,10,12,14,15),4,3)


dminus4 = d - 4

a = 6

a*t

m = matrix(c(1,2,3,4),2,2)
n = matrix(c(.6,.2,.3,-.4),2,2)

m-n
m+n

## Built-in Functions


p = c(1,2,4,6,-2,0,18,2,1,-4)
p[3]

mean(p)
median(p)
sort(p)
sd(p)
var(p)
unique(p)

quantile(p)
quantile(p,c(.03,.73))
q = quantile(p,c(.03,.73))

min(p)
max(p)
length(p)

which(p>3)
length(which(p>3))
which(p<10)
which(p==3)
length(which(p==3))


## Matrices & Data Frames

ticker =c("IBM", "TIF","CSCO","MS")
price =c(160.07,91.99,28.21,39.25)
p = data.frame(ticker,price)


## Importing Data

setwd("/users/gabriellefrieder/Desktop/Course Data")

d = read.csv("Packages.csv",header=TRUE)
d[1,]
dim(d)

## Manipulating Stored Data

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)

d$driversworking[1:10]
d$avghoursperdriver[1:10]

totalhours = d$driversworking*d$avghoursperdriver


## Use Functions on Data

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)

mean(d$avghoursperdriver)
median(d$avghoursperdriver)
sd(d$avghoursperdriver)
cov(d$avghoursperdriver,d$driversworking)
cor(d$avghoursperdriver,d$driversworking)
quantile(d$avghoursperdriver,c(.25,.75))
quantile(d$avghoursperdriver,c(.99))
min(d$avghoursperdriver)

unique(d$year)
unique(d$avghoursperdriver)
length(d$year)
length(d$avghoursperdriver)
dim(d)

which(d$pctoversized > .1 & d$weekend ==1)
mean(d$pctoversized)

## Charts


setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)

hist(d$avghoursperdriver)
hist(d$avghoursperdriver,main="Average Hours Per Driver",xlab="")

hist(d$pctoversized,main="Percent Oversized Packages",xlab="")

plot(d$avghoursperdriver,d$driversworking)
plot(d$avghoursperdriver,d$driversworking,pch=20,cex=.5,col="red",xlab="Hours Per Driver",ylab="Drivers Working",cex.lab=.8,cex.axis=.8)

## Aggregate Function

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)

aggregate(d$driversworking,by=list(d$weekend),mean)
aggregate(d$driversworking,by=list(d$holiday),mean)
aggregate(d$driversworking,by=list(d$year),mean)

aggregate(d$driversworking,by=list(d$weekend),sum)

aggregate(d$driversworking,by=list(d$weekend,d$holiday),mean)

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)


## Reassigning Values in a Dataset

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)

d$holiday[which(d$holiday==2)] = 1


## Create New Variable Within Our Dataset

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)

totalhours = d$driversworking*d$avghoursperdriver

d = cbind(d,totalhours)

pctdmwins = d$pctdamaged*d$pctwithinsurance
d = cbind(d,pctdmwins)

## Practice

v = c(-7,8,15,-1,0,0,3,-5,18,-6,-4,0,5,0)

s = c(1,2,3,4,6,10,11,12)
m = matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),4,3)
m[3,2]
m = matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),3,4)

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Prices.csv",header=TRUE)

plot(d$VIXclose,d$MarketVolume,pch=20,cex=.5,col="black",xlab="VIX Close",ylab="Market Volume",cex.lab=.8,cex.axis=.8)

cor(d$VIXclose,d$MarketVolume)

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Packages.csv",header=TRUE)


## Quiz

v = c(-7,8,15,-1,0,3,-5,18,-6,-4,0,5,0)

setwd("/users/gabriellefrieder/Desktop/Course Data")
d = read.csv("Prices.csv",header=TRUE)

setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Taxi.csv",header=TRUE)

dim(d)
d[1,]

fit = lm (d$fare~d$distance)