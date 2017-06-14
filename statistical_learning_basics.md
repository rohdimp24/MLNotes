
* The main funda of the regression is to reduce the error that you have between the predicted Y and the actual Y. 

* in order to find Y based on X the simplest way is to take the average of all the values of Y at x
E(Y|X=x).. .this is the function f(x)

* sometimes you may not have enough points at the X=x  (no value of Y at say x-4). In this case we will take the average of the nearest neighbors so say x=4 take [3,5] and then average the value  

* the KNN is also called the **local averaging**

* nearest neighbour method will not work in large dimentions (the number of predictors is more than 4) this is because of the curse of dimentionality. The nearest neighbors tend to be far away in high dimentions

* the general form of equation for finding Y given x is 
Y=f(x)+error

The f(x) can be linear or non-linear to find the estimated value of Y
F(x) is the function. it could be a simple as E(Y|x=x)

* we want to 
find a function f such that Y ≈ f (X ) for any observation (X, Y ). there are two main ways to find out the function f(x)
**Parametric methods**
***Non-parameteric methods**

* **Parametric Approach** uses the 2 step approach
1. First, we make an assumption about the functional form, or shape, of f.
so we start with a function like
f=b0+b1X1+b2X2+....bpXp
So now we need to estimate the b0...bp
Instead of having to estimate an entirely arbitrary p-dimensional function f(X), one only needs to estimate the p+1 coefficients

2. Second After a model has been selected, we need a procedure that uses the training data to fit or train the model. One of the most common way is the OLS regression


The potential disadvantage of a parametric approach is that the model we choose will usually not match the true unknown form of f. We are not aware of the true form of the function . We are basically estimating the shape of the function using the data that we have. In case the estimated shape is far away from teh true form of the functuon we will have large error

* Overfitting is when we try to fit the training data too much so that the testing data estimates are not that good


* **Non-parametric** methods do not make explicit assumptions about the func- tional form of f
Instead they seek an estimate of f that gets as close to the data points as possible without being too rough or wiggly
They require a large number of observations to make the estimation for f
They are the smoothing functions family of algorithm ..spline is one example



**Assessing the Model Accuracy**


* MSE is a measure of finding how the model is behaving
The MSE will be less for the training data in case of the flexible model (splines, curves) but it will be high for the test data beacuase of the overfitting

* The **degrees of freedom** is a quantity that summarizes the flexibility of a curve


