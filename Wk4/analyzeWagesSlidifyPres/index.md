---
title       : Predicting Mid-Atlantic Wage Data
subtitle    : Course Project - Developing Data Products
author      : Ajay Ghanti
job         : Coursera Data Science Specialization (JHU)
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
revealjs    :
    theme   : moon
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
--- #title

<style>
.reveal .slides {
    text-align: left;
}

.reveal b {
    color: blue;
}

</style>

## Course Project<br/>Predicting Mid-Atlantic Wage Data

Developing Data Products
<br/>
Coursera Data Science Specialization (JHU)

<small>
    March 8, 2017<br/><br/>
    __Ajay Ghanti__<br/>
    [LinkedIn](https://www.linkedin.com/in/ajayghanti) / [GitHub](https://github.com/aghanti7)
</small>

--- #intro

## Course Project

The goal of the assignment, as part of the Developing Data Products course by JHU on Coursera is to build the following:

1. A <b>Shiny application</b> with some form of input widget, some operation on the UI input in `server.r`, some reactive output displayed as a result of server calculations, as well as enough documentation so that a novice user could use the application, and finally, deploy it on Rstudio's servers
2. A <b>Reproducible Pitch Presentation</b> to pitch the app, that contains a 5 slide html5 slide deck, done in either Slidify or Rstudio Presenter, contains some embedded R code that gets run, and is pushed to and hosted on GitHub or Rpubs

--- #data

## The Data

This application has been built to use the Wage dataset from the ISLR package, containing wage and other data for a group of 3000 workers in the Mid-Atlantic region.



```r
summary(Wage)
```

```
##       year           age               sex                    maritl    
##  Min.   :2003   Min.   :18.00   1. Male  :3000   1. Never Married: 648  
##  1st Qu.:2004   1st Qu.:33.75   2. Female:   0   2. Married      :2074  
##  Median :2006   Median :42.00                    3. Widowed      :  19  
##  Mean   :2006   Mean   :42.41                    4. Divorced     : 204  
##  3rd Qu.:2008   3rd Qu.:51.00                    5. Separated    :  55  
##  Max.   :2009   Max.   :80.00                                           
##                                                                         
##        race                   education                     region    
##  1. White:2480   1. < HS Grad      :268   2. Middle Atlantic   :3000  
##  2. Black: 293   2. HS Grad        :971   1. New England       :   0  
##  3. Asian: 190   3. Some College   :650   3. East North Central:   0  
##  4. Other:  37   4. College Grad   :685   4. West North Central:   0  
##                  5. Advanced Degree:426   5. South Atlantic    :   0  
##                                           6. East South Central:   0  
##                                           (Other)              :   0  
##            jobclass               health      health_ins      logwage     
##  1. Industrial :1544   1. <=Good     : 858   1. Yes:2083   Min.   :3.000  
##  2. Information:1456   2. >=Very Good:2142   2. No : 917   1st Qu.:4.447  
##                                                            Median :4.653  
##                                                            Mean   :4.654  
##                                                            3rd Qu.:4.857  
##                                                            Max.   :5.763  
##                                                                           
##       wage       
##  Min.   : 20.09  
##  1st Qu.: 85.38  
##  Median :104.92  
##  Mean   :111.70  
##  3rd Qu.:128.68  
##  Max.   :318.34  
## 
```

--- #app

## The App

The Mid-Atlantic Wage dataset has 3000 observations on 12 variables. After some EDA, have picked 9 of these variables for our app. By default, we plot Age vs. Wage; what you need to do is pick upto 3 additional variables, and the app will redraw the plot as a facet grid.<br/><br/>The app also fits a regression model (linear is the default), which can be changed to one of the other choices displayed in the radio buttons under "Select Smoothing Method". You can also choose to display the confidence interval for the fitted line.

--- #links

## Give it a spin!

Shiny App: [Predicting Mid-Atlantic Wage Data](https://ajayghanti.shinyapps.io/analyzeWagesShinyApp/)

<small>
    Note: For best results, please view the app in full screen mode
    <br/><br/>
    Source Code:
    <br/>[Shiny App](https://github.com/aghanti7/courseraDevelopingDataProducts/tree/gh-pages/Wk4/analyzeWagesShinyApp)
    <br/>[Slidify Presentation](https://github.com/aghanti7/courseraDevelopingDataProducts/tree/gh-pages/Wk4/analyzeWagesSlidifyPres)
</small>


