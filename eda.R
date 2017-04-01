setwd("c:/users/jim/documents/dataanalysis")
dataset=read.csv("whatsapp_fullfix.csv", sep="~", header=TRUE)
library(ggplot2)
ggplot(means.long,aes(x=variable,y=value,fill=factor(gender)))+
  geom_bar(stat="identity",position="dodge")+
  scale_fill_discrete(name="Gender",
                      breaks=c(1, 2),
                      labels=c("Male", "Female"))+
  xlab("Beverage")+ylab("Mean Percentage")

library(sm)
attach(dataset)
weekday.f <-factor(dataset$WEEKDAY)
dataset$name <-as.factor(dataset$name)
str(dataset$name)

name.f <- factor(dataset$name, levels= c(1,2,3,4),
                labels = c("Alex", "Dave", "Jim", "Sean")) 


# plot densities 
sm.density.compare(dataset$HOUR, dataset$name, xlab="Hour of Day", xlim=c(1,24))
title(main="Texts by Hour of Day")

# add legend via mouse click
colfill<-c(2:(2+length(levels(dataset$name)))) 
legend(locator(1), levels(dataset$name), fill=colfill)



# plot densities 
sm.density.compare(dataset$WEEKDAY, dataset$name, xlab="Day of Week", xlim=c(1,7))
title(main="Texts by Day of Week")

# add legend via mouse click
colfill<-c(2:(2+length(levels(dataset$name)))) 
legend(locator(1), levels(dataset$name), fill=colfill)
