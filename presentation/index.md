---
title       : Developing Data Products
subtitle    : Course Project
author      : Nick Pistiolis
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Classification Demo

This presentation is being created as part of the peer assessment for the coursera developing data products class. The assignment is geared toward ensuring the following concepts were well understood by the students:

1. Shiny to build data product application.

2. R-Presentation or slidify to create data product related presentations.

--- 

## The Application

To display the understanding of using shiny to build an application, a simple application called Classification Demo has been developed and deployed at: https://pistn.shinyapps.io/c9w3

The application allows the user to:

1. Select the classifier that wants to use from "K Nearest Neighbours", "Support Vector Machine" and "Random Forest".

2. Select the predictors for classification.

---

## Data

The dataset used for this application is "iris3" which is implemented in R.


```r
data("iris3")
str(iris3)
```

```
##  num [1:50, 1:4, 1:3] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  - attr(*, "dimnames")=List of 3
##   ..$ : NULL
##   ..$ : chr [1:4] "Sepal L." "Sepal W." "Petal L." "Petal W."
##   ..$ : chr [1:3] "Setosa" "Versicolor" "Virginica"
```

As you can see there are four predictors and three classes. For every class there are 50 observations.

---

## Output 

The output is a graph which shows the classification boundaries for the three classifiers. Every time the user selects the two predictors from the dataset "iris3", they are used for training the selected classifier. Then many test data are created artificially. The output graph shows, to which class the test data are classified.

1. This application can be used for demonstration purposes.
2. It could also be used for selecting predictors one by one in a more complex model.
