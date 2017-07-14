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
data(Boston)
names(Boston)

plot(Boston$zn,Boston$crim)

attach(Boston)

#first model
lm.fit=lm(medv~lstat ,data=Boston)
summary(lm.fit)

confint(lm.fit)

predict(lm.fit,data.frame(lstat=(c(5,10,15))),interval="prediction")


plot(lstat ,medv,pch=20)
abline(lm.fit,col="red",lwd=3)



par(mfrow=c(2,2))
plot(lm.fit)
#these are the outliers this is basically the sqrt(standarised residuals)
which(rstudent(lm.fit)>3)

#fitted.values(model) : will give the predicted values of the model

plot(fitted.values(lm.fit),rstudent(lm.fit))


which.max(hatvalues(lm.fit))


lm.fit2=lm(medv~lstat+age,data=Boston)
summary(lm.fit2)

lm.fit3=lm(medv~.,data=Boston)
summary(lm.fit3)

cor(Boston)


lm.fit4=lm(medv~.-indus-age,data=Boston)
summary(lm.fit4)
plot(lm.fit4)

lm.fit5=lm(medv~lstat+I(lstat^2),data=Boston)
summary(lm.fit5)


anova(lm.fit,lm.fit5)

plot(lm.fit5)
