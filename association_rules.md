
* http://blog.revolutionanalytics.com/2015/04/association-rules-and-market-basket-analysis-with-r.html
R has an excellent suite of algorithms for market basket analysis in the arules package by Michael Hahsler and colleagues

http://paginas.fe.up.pt/~ec/files_1112/week_04_Association.pdf
* market Basket Analysis (MBA) can help in knwoing:
1. Fast and slow movers
2. products which are puchased together
3. Products which might benefit from promotions


* based on the MBA you can decide on altering the store layout or introduce discounts or promotions

* mba help in understandign the bundling strategies

###Association Rule Mining

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



* the association rules can be used in other domains as well 
1. In case of Retail we consider Baskets as transactions and items as the items in the transactions
2. In case of the text to find which words are generally together
 if documents are basket and items  are the words in the document
 word4=>word5
 when word4 comes word5 also comes in the document ...could have been used for the lube oil kind of analysis

3. If the same links are appearing in the webpages then they might be similar

4. If the same sentences are appearing the two documents then the documents might be similar



In association analysis, a collection of zero or more items is termed an **itemset**
If an itemset contains k items, it is called a k-itemset. For instance, {Beer, Diapers, Milk} is an example of a 3-itemset.


###Aprioiri Algo

Any subset of a frequent itemset must be frequent

so if {A,B,C} are frequent together then {A,B},{A,C} must also be frequent.

conversly if an itemset is infrequent then all the superset are also infrequent

so {ABCDE} is infrequent so {A,B,C,D} is also infrequent


* A very good link for learning Apriori in R https://blog.exploratory.io/introduction-to-association-rules-market-basket-analysis-in-r-7a0dd900a3e0



TO BE FILLED



### Objective measures of rule interest
1. Support P(A,B)
2. Confidence or strength  P(B|A)
3. Lift or Interest or Correlation
4. Conviction
5. Leverage or Piatestsky-Shapiro
