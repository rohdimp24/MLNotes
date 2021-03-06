
* http://blog.revolutionanalytics.com/2015/04/association-rules-and-market-basket-analysis-with-r.html
R has an excellent suite of algorithms for market basket analysis in the arules package by Michael Hahsler and colleagues

http://paginas.fe.up.pt/~ec/files_1112/week_04_Association.pdf
* market Basket Analysis (MBA) can help in knwoing:
1. Fast and slow movers
2. products which are puchased together
3. Products which might benefit from promotions


* based on the MBA you can decide on altering the store layout or introduce discounts or promotions

* mba help in understandign the bundling strategies

### Association Rule Mining

* Finding frequent patterns, associations, correlations, or causal structures among sets of items in transaction databases

* understand the customer buying habits by finding the associations and correlations between the different items that customers place in the shopping basket


{bagels,...}=> potato chips

bagels when purchased with something is generally followed by the purchase of potato chips


* generally we have a database of teh transactions. Where each transaction is a list of items purchased by a customer in a order (visit)

we need to find the correlations between the items that are present in the transactions. for e..g orange juice and soda are generally bought together. 
or soda and milk are never bought together

* A=>B [s,c]

s or the support is the frequency of the rule appearing in the transactions. That is we can find A and B together x percentage of times. 
It is basically P(A U B)

c or confidence is the conditional probablity thet if A is present what is the probability that b is also present
P(B|A) which can also be written in terms of support as sup(A,B)/sup(A) = P(AUB)/P(A)

Also A and B are the itemsets with no common items
so basicaly A={orange juice, chips}
B={soda, beer}
AUB= {orange juice, chips,soda, beer}

* Support is an important measure because a rule that has very low support may occur simply by chance

* A low support rule is also likely to be uninteresting from a business perspective because it may not be profitable to promote items that customers seldom buy together



* We can set up the minimum limit for the support and confidence for them to be considered as frequent. Formally we can say:
Given a set of transactions T, find all the rules having **support ≥ minsup and confidence ≥ minconf**, where minsup and minconf are the corresponding support and confidence thresholds.


* In general 
**SUPPORT DETERMINES THE FREQUENCY OF THE RULES**

* **CONFIDENCE DETERMINES WHICH RULES ARE STRONG**


* the association rules can be used in other domains as well 
1. In case of Retail we consider Baskets as transactions and items as the items in the transactions
2. In case of the text to find which words are generally together
 if documents are basket and items  are the words in the document
 word4=>word5
 when word4 comes word5 also comes in the document ...could have been used for the lube oil kind of analysis

3. If the same links are appearing in the webpages then they might be similar

4. If the same sentences are appearing the two documents then the documents might be similar



In association analysis, a collection of zero or more items is termed as **itemset**
If an itemset contains k items, it is called a k-itemset. For instance, {Beer, Diapers, Milk} is an example of a 3-itemset.


### Aprioiri Algo

Any subset of a frequent itemset must be frequent

so if {A,B,C} are frequent together then {A,B},{A,C} must also be frequent.

conversly if an itemset is infrequent then all the superset are also infrequent

so {ABCDE} is infrequent so {A,B,C,D} is also infrequent


* A very good link for learning Apriori in R https://blog.exploratory.io/introduction-to-association-rules-market-basket-analysis-in-r-7a0dd900a3e0

There are two steps in the Apriori algo
1. Find the frequent item sets from the transactions : they should support the minimum supprt
2. Find the high confidence rules out of the frequent itemsets : they should be above a minimum confidence number (basically we want to make sure that the rules are not appearing by chance)



## Factors affecting Apriori algo
1. **Minimum Support thershold**: if the support number is very less then most of the item sets will become frequent and the time taken to finalize the frequent itemssets will be large. 


2. **Number of Items (Dimensionality)**: As the number of items increases, more space will be needed to store the support counts of items.If the number of frequent items also grows with the dimensionality of the data, the computation and I/O costs will increase because of the larger number of candidate itemsets generated by the algorithm. 
There will be a possiblity to have 2^k-1 where k is the number of the items

3. **Number of Transactions** Since the Apriori algorithm makes repeated passes over the data set, its run time increases with a larger number of trans- actions.

4. **Average Transaction Width** : Transaction width is the number of items in a single transaction. 
For dense data sets, the average transaction width can be very large. This affects the complexity of the Apriori algorithm as the size of the frequent itemsets will increase. {A,b,c....n}. This will mean a large numner of candidate itemsets to be examined. the number of levels will increse ..level 1, level2....level w



### Pruning strategy

#### Support based pruning: 
if less than a minimum support remove the candidates
also if a subset is less frequent then all the superset needs to be pruned. so if {a} is less frequent the {a,b} is also less frequent
this is used to decide which all candidates will go to the next level
In case of the lattice representation it means prune all the children below this level as they are the superset

{bread}
{diaper}
{milk}

if milk is less frequent then we will not have any candidate itemset with size 2 that has milk
{bread,diaper} is the only next level candidate


#### Confidence based pruning

Antecendent => consequent : this is the structure of the rule

if {bcd} −→ {a} is low then
All the rules containing item a in its consequent, including {cd} −→ {ab}, {bd} −→ {ac}, {bc} −→ {ad}, and {d} −→ {abc} can be discarded.

This can also be writtn as  (From MLIA)
if {bcd}--> {a} is low in confidence 
then all the subset of the left hand side will also be low in confidence
{bc}->{ad}, {b}-->{cda},{c}-->{bda},{d}-->{bca},{cd} −→ {ab}, {bd} −→ {ac}

* Confidence is non‐increasing as number of items in rule consequent increases
 
c(ABC --> D) >= c(AB --> CD) >= c(A --> BCD)





TO BE FILLED


## Finding minimal rules

Basically our problem is to reduce the number of rules. Even after the confidence pruning you will have a large number of rules.

In order to reduce the number of rules one of the way is to find **maximal frequent itemsets**, which is defined as frequent itemsets which are not proper subsets of any other frequent items. (check the arules book). They are the ones which will connect to infrequent itemsets. (basically there children can only be infrequent nodes).. but the problem is that this method will loose on the support value

**frequent closed itemsets** this is another approach to reduce the number of mined rules. This approach will also keep the support information intact

**Lift** is often used as the **practical** way to reduce the number of rules.


### Objective measures of rule interest
1. Support P(A,B)
2. Confidence or strength  P(B|A)
3. Lift or Interest or Correlation
4. Conviction
5. Leverage or Piatestsky-Shapiro


A pattern is considered subjectively uninteresting unless it reveals unexpected information about the data or provides useful knowledge that can lead to profitable actions.

For example, the rule {Butter} −→ {Bread} may not be interesting, despite having high support and confidence values, because the relationship represented by the rule may seem rather obvious. 

On the other hand, the rule {Diapers} −→ {Beer} is interesting because the relationship is quite unexpected and may suggest a new cross-selling opportunity for retailers


An objective measure is a data-driven approach for evaluating the quality of association patterns. It is domain-independent and requires minimal in- put from the users, other than to specify a threshold for filtering low-quality patterns



## Lift
(from http://analyticstrainings.com/?p=151)

A lift value **greater than 1 indicates that X and Y appear more often together than expected** ; this means that the occurrence of X has a positive effect on the occurrence of Y or that X is positively correlated with Y.

A lift **smaller than 1 indicates that X and Y appear less often together than expected**, this means that the occurrence of X has a negative effect on the occurrence of Y or that X is negatively correlated with Y

A lift value near 1 indicates that X and Y appear almost as often together as expected; this means that the occurrence of X has almost no effect on the occurrence of Y or that X and Y have Zero Correlation.





**We are looking for the rules where the lift is > 1**


## How to interprest the rules

p --> Q has 
* support % =3.61   ...this implies P & Q occurs in 3.61% of the transactions
* confidence % = 88.91 ... this implaies the probabily of finding Q in the transaction in which P is also present is 89% ( this is a conditional prob kind of sentence)..
Also we can say that the rule p-->Q is correct atleast 89% of time
* lift=19.41
This means that probability of finding Q in the transactions containing P increases 19 times (this is a correlation kind of statement))



## Finding redundant rules (http://blog.revolutionanalytics.com/2015/04/association-rules-and-market-basket-analysis-with-r.html)
two rules

{a, b}-->{d} ..sub rule
{a,b,c}-->{d}  ..superrule

You can remove the superrule (containing more variables)
if superrule has a lower or same lift as the sub rule

which means that we are not adding anything to the correlation by adding more paramteters so remove that rule
but if the lift is higher than the subrule then you should have both the rules




## Possible Recommendations for X=>Y Rule (Where X and Y are 2 separate Products and have high support, high confidence and high positive lift > 1)

1. Put X and Y Closer in the Store
2. Package X with Y
3. Package X and Y with a poorly selling item
4. Give Discount on only one of X and Y
5. Increase the Price of X and lower the price of Y (or vice versa)
6. Advertise only one of X and Y i.e. do not advertise X and Y together
Example: If X was a toy and Y a form of sweet, then offering sweets in the form of toy X could also be a good option.



## Examples
1. http://www.rdatamining.com/examples/association-rules
2. https://blog.exploratory.io/introduction-to-association-rules-market-basket-analysis-in-r-7a0dd900a3e0
3. https://www.youtube.com/watch?v=Gy_nqzJMNrI (grocery example)
4. Good link to understand how to filter out the rules of choice https://www.youtube.com/watch?v=91CmrpD-4Fw  .cosmetoic data
5. https://www.safaribooksonline.com/library/view/r-for-data/9781784390815/ch09s08.html..chapter gives good example for using the arules
