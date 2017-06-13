
# Notes on Linear Regression
(These notes are from EDX course, stanford , udacity, university of washington)
* The baseline model is the one that will always give the same value irrespective of the input. One of the baseline could be y=mean(X)

* The **training model** R2 will alsways increase or remain same if we increase the number of variables. It can never be -ve and the model cannot do worse than the baseline (mean)

* The **testing model** R2 can be in negative as it can do worse on the unknown data

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
(coeff+2*SE,coeff-2*SE)


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
 
