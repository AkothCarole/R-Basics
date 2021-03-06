---
  title: "Week 12 IP"
author: "Caroline"
date: "7/12/2020"
output:
  pdf_document: default
html_document: default
---
  
  ## Week 12 IP R Basics 
  
  Research Question

A Kenyan entrepreneur has created an online cryptography course and would want to advertise it on her blog. She currently targets audiences originating from various countries. In the past, she ran ads to advertise a related course on the same blog and collected data in the process. She would now like to employ your services as a Data Science Consultant to help her identify which individuals are most likely to click on her ads. 

#Define the question

#metric for success
#The context
#Experimental design taken 
#Appropriateness of the available data

##Tasks
Find and deal with outliers, anomalies, and missing data within the dataset.
Perform  univariate and bivariate analysis.
From your insights provide a conclusion and recommendation.
NB: Your final deliverable will be either an markdown document,  which will comprise the above sections;

The dataset for this Independent project can be found here [Link].  

```{r}
#Read Data

data <- fread('http://bit.ly/IPAdvertisingData')

head (data)
```

## Including Plots

You can also embed plots, for example:
  
  ```{r}
#Find and deal with Outliers

is.na(data)
```
``
```{r}
# Find Anomalies and Missing data/Duplicates

duplicated_rows <- data[duplicated(data),]
duplicated_rows
```

This data has no missing or duplicate fields, We can therefore proceed to Univariate and Bivariate analysis

```{r}
#Check outliers
boxplot(data)

#Drop outliers
cleandata <- na.omit(data)
```


```{r, echo=FALSE}
#Univariate and Bivariate analysis
head(data)
```

```{r}
# Univariate Analysis.
#
time_on_site <- c(data$`Daily Time Spent on Site`)
age <- c(data$`Age`)
income <- c(data$`Area Income`)
internetusage <- c(data$`Daily Internet Usage`)
clickedAd <- c(data$`Clicked on Ad`)

# Barplots of Numerical columns.
#

hist(time_on_site)
hist(age)
hist(income)
hist(internetusage)
hist(clickedAd)
```
## Correlation of variables
```{r}
#Determine correlation of the fields

cor(time_on_site,clickedAd)

cor(clickedAd,age)

cor(clickedAd,income)
```
##Data Visualization
```{r}
plot(clickedad, internetusage, xlab = "Clicked Ad", ylab = "Internet Usage")

plot(clickedAd, income, xlab = "Clicked Ad", ylab = "Area Income")


```
```{r}
# Visualizing Relationships between Numerical Variables.
# ----
#
library(GGally)

numcol <- data[, c("Daily Time Spent on Site","Age", "Area Income", "Daily Internet Usage")]

ggpairs(numcol, 
        lower=list(continuous="smooth", wrap=c(colour="blue")),
        diag=list(continuous="bar", wrap=c(colour="blue"),
                  cardinality_threshold = 1000))


```
```{r}
```