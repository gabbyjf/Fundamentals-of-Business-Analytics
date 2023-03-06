options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("Taxi.csv",header=TRUE)

## fare ~ distance

plot(d$distance,d$fare,pch=20)

## outliers type 1: extreme values

q = quantile(d$fare,c(.01,.99))

d = d[-which(d$fare < q[1]),]
d = d[-which(d$fare > q[2]),]

q = quantile(d$distance,c(.01,.99))

d = d[-which(d$distance < q[1]),]
d = d[-which(d$distance > q[2]),]


## outliers type 2: "weird" values

length(which(d$dfare == 0))

plot(d$distance,d$fare,pch=20)

aggregate (d$fare,by=list(d$fare),length)

d = d[-which(d$fare == 52.00),]

plot(d$distance,d$fare,pch=20)


options(scipen=999)
setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("NBA.csv",header=TRUE)

par(mfrow=c(2,2))
plot(d$Ratings,d$PTS,pch=20,cex=.5)
plot(d$Age,d$PTS,pch=20,cex=.5)
plot(d$MP,d$PTS,pch=20,cex=.5)

length(which(d$PTS==0))
length(which(d$Ratings==0))
length(which(d$MP==0))

q = quantile(d$PTS,c(.01,.99))
q= quantile(d$Ratings,c(.01,.99))

d = d[which(d$PTS > 0),]
d = d[-which(d$Ratings < q[1]),]
d = d[-which(d$Ratings > q[2]),]

n = length(d$Player)
train = sample(1:n,.7*n,replace=FALSE)
test = setdiff(1:n,train)
dtrn = d[train,]
dtst = d[test,]

fit = lm(dtrn$PTS ~ dtrn$Ratings + dtrn$Age + dtrn$MP)
summary(fit)

