setwd("/users/gabriellefrieder/Downloads/Course Data")
d = read.csv("IMDB.csv",header=TRUE)

w = d[which(d$country=="USA"),]

length(which(d$imdb_score<4))
(156/5043)*100

aggregate(d$num_critic_for_reviews,by=list(d$num_user_for_reviews),mean)

plot(d$num_critic_for_reviews,d$imdb_score,pch=20)

dim(w)

mean(w$gross,na.rm=TRUE)
mean(w$budget,na.rm=TRUE)
mean(w$gross,na.rm=TRUE) / mean(w$budget,na.rm=TRUE)

aggregate(d$gross/d$budget,by=list(d$movie_title),mean,na.rm=TRUE)

w = d[which(d$country=="USA"),]
length(which(w$imdb_score<4))

dim(w)
(125/3807)*100

plot(w$num_critic_for_reviews,w$imdb_score,pch=20)

aggregate(w$gross/w$budget,by=list(w$movie_title),mean,na.rm=TRUE)
mean(w$gross,na.rm=TRUE) / mean(w$budget,na.rm=TRUE)