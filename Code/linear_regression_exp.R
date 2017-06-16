library(ISLR)
library(MASS)

advertising=read.csv("datasets/advertising.csv")
summary(advertising)

model1=lm(Sales~TV,data=advertising)
summary(model1)
RSS=sum(model1$residuals^2)
predictions=predict(model1,newdata = advertising)
RSScalc=sum((advertising$Sales-predictions)^2)
#RSS is sames as RSScalc

N=nrow(advertising)
RSE=sqrt(RSScalc/(N-2))


model2=lm(Sales~TV+Radio+Newspaper,data=advertising)
summary(model2)
predictions2=predict(model2,newdata = advertising)

df=advertising
df$pred=predictions2

plot(model2)

confint(model2)

0.192088-0.16734031

0.02474769/0.012468

0.0170/0.008611

cor(c(advertising$TV,advertising$Radio,advertising$Newspaper))


model3=lm(Sales~TV*Radio,data=advertising)
summary(model3)
plot(model3)


########Boston housing ######

library(MASS)
library(ISLR)


