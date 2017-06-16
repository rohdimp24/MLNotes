
# Notes on Linear Regression
(These notes are from EDX course, stanford , udacity, university of washington)
* The baseline model is the one that will always give the same value irrespective of the input. One of the baseline could be y=mean(X)

* The **training model** Multiple R2 will alsways increase or remain same if we increase the number of variables. It can never be -ve and the model cannot do worse than the baseline (mean)

* The **testing model** Multiple R2 can be in negative as it can do worse on the unknown data

* you should check if the variables are **multicolinear**...also you should remove the variable one at a time and see the effect as they are being insignificant together but may be significant independently

* For the **correlation** to be of concern the value should typically be higher than 0.7 or less than -0.7
* in R you get the summary of the various coefficients value. You essentially get the following
Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -3.4299802  1.7658975  -1.942 0.066311 .  
AGST         0.6072093  0.0987022   6.152  5.2e-06 ***
HarvestRain -0.0039715  0.0008538  -4.652 0.000154 ***
WinterRain   0.0010755  0.0005073   2.120 0.046694 *  
Age          0.0239308  0.0080969   2.956 0.007819 ** 

The coefficient values are estimated. We can determine the confidence interval of what should be the true estimates
(coeff+t-value at .95*SE,coeff-t-value at .95*SE)

Note that when the number of samples are large the value of t will be more or less same as z at .95 = 1.96
but for smalled number of samples the t-value will be mostly 2
https://www.medcalc.org/manual/t-distribution.php

In case of the stat learn example of advertising..the confidence interval for the Radio is 
Radio+/- 1.96*SE when N=200
while it is
Radio+/- 1.98*SE when N=100



AGST will lie in between (0.60+2*0.098,0.60-2*0.098)

* If the Y and X are not related then the coefficient of X will be 0

Y=0*X+bo
we can determine if the relationship is there or not using the hypotheis testsing

* The way to read the meaning of the line in summary is 
pvalue detrmines the probability of accepting the Null hypothesis. the Null is that the coefficient has no effect on Y. 
So if the p value is very small < 0.05 it means it is very unlikely that the Null is true and hence we cannot avoid using the coefficient

* Calculating the CI for the coefficient will give the range of variation that this coefficient can bring on the dependent Y. (0.42,0.53) will tell that for 95% times the value will be in this range and the effect will be 0.42 to 0.53 times X

* Also the CI will not contain 0 if the coefficient is significant ...meaning you will have some effect of this variable on the Y in 95% time

* The value of R2 is subjective. A lower R2 might be OK for some domains while you might require a very high R2 for some other domains

* the regression coefficient B estimates the expected change in the Y per unit change in X **with all the predictors held fixed** But the issue is that in reality the predicters are somewhat related..there is a **interaction effect**

* In R when you use the lm() you get the output containing Multiple R-Squared and Adjusted R-Squared. 
The Adjusted R-Squared value takes into account the number of the variables that have been used. If the variables dont make sense then the Adjusted R-square value will decrease. This way we can assess if the new predictor should be included or not

* the multiple r2 value suggests how much variance the model can explain in the Y. More the variance that can be explained by the model , the better it is. Or in other words the larger the value of the r2 the better the model is


* Some of the question that we want to know are
    Are all the predictors important or only a subset is important
    How well the model fit the data

* We will want to check the model with all the subsets of teh predictors and pick up the model where the RSS (SSE) is the minimum
But the number of the subset will quickly grow to a huge number so we use other methods

* there are some predictors which are called the categrical variables or qualitative variable. There is no order also

* for bringing the qualitative varaibles in the equation we need to create dummy variables. The number of the dummy variables = k-1 where k is the number of different values for the qualitative varibale. E.g. gender takes 2 values male and female so we create 1 dummy variable
the eq will look like  y=b0+b1x1+e
in case we have 3 values like ethinicity {asian, caucasian, afro ameriacan}
y=bo+b1x1+b2x2+e
x1 will represent asian, not asian
x2 will represent caucasian , not caucasian

* The **RSE** is considered a measure of the lack of fit of the model (3.5) to the data. If the predictions obtained using the model are very close to the true outcome values—that is, if yˆi ≈ yi for i = 1, . . . , n—then (3.15) will be small, and we can conclude that the model fits the data very well. On the other hand, if yˆi is very far from yi for one or more observations, then the RSE may be quite large, indicating that the model doesn’t fit the data well.

RSE=sqrt(RSS/(N-2))
RSS is the Residual sum of sqaure error (AKA SSE)

* The RSE is similar to RMSE only thing is that in RMSE the division is by N while in RSE the division is by N-2

* Instead of RSS R2 is used. R2 measures the proportion of variability in Y that can be explained using X.
An R2 statistic that is close to 1 indicates that a large proportion of the variability in the response has been explained by the regression. 

* **Variable Selection** :If adding a parameter in the liner regression equation increases the R2 very slightly then you can drop that paramter. However if the increase is large then we should include this paramter in the equation

* F-statistics tell if any predictors has an effect on Y. A large value of F at a significant p value is what we are interested in. In other words it means that the atleast one of the coefficients CI doesnot contain 0 (it will always have some effect on the regression equation)

* **why F-statistics is important?**

Even though we have the p-values for each of the coefficients to determine if that coefficient has an effect or not , but we know that if the number of the predictors is large (greater than 100) than you will find that atleast 5% of the coefficients will be shown as significant. This happens by chance. So in this situation to make sure that these coefficients are really important we will check the F-score. If the F-score is large with small p-value then the parameters have an effect for sure.


* **Interactivity**
If you see that the parameters used might have an association with each other. That is if we increase one paramter, the other is going to be affected . For e.g number of workers and number of production line. You cannot increase the production lines without considering the numner of workers. In this situation the linear equation have to be modified to include some non-linearilty

* in some cases the interactivity term is significant while the individual parameters are not.But the hierarichal rule suggest that we need to include all the 3 factors that is x1, x2 and x1*x2

* OLS regression is the form of regression based on simple least square calculations. These include the simple linear regression,multiple linear regression, polynomial regression

* **Multiple versus multivariate**
in case of multiple regression the response variable (Y) is a single variable while the predictors can be 1 or many
In case of multivariate the response varaibles can also be many  

* I think the main aim of the model is to account for maximum variance in Y. That means through the model you should be able to cover all the possible values of Y in the data. The less the coverage more will be the error. Th epredicted values will have different range while the true values will have some other range


* ?how the hatvalues() works?