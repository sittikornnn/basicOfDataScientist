#Variables
x <- 1
y <- 2
x+y
x*y
z=3
4 -> w
income <- 10000
expense <- 9999
saving <- income -expense
print(saving)

rm(saving)
help("rm")

#Data Types
#Numeric
x <- 555
class(x)
is.numeric(x)

#Character (String, text)
student <- 'Bird'
class(student)

#Factor (Category data)
d <- "2023-01-26"
class(d)
Today <- as.Date("2023-01-26")
class(Today)

#Logic (Boolean T/F)
music_lover <- T
class(music_lover)

#Vector
students <- c('Bas','JJ','Opal')
ages <- c(20,19,18)
music_lover <- c(F,T,T)

#Create a new column
Hcu$students

Hcu$double_ages <- Hcu$ages * 2

#Delete a column
Hcu$double_ages <- NULL

#write CSV file
write.csv(Hcu,'HCUAI3303.csv')

#Basic statistics
sum(Hcu$ages)
mean(Hcu$ages)
median(Hcu$ages)
sd(Hcu$ages)
var(Hcu$ages)
log(Hcu$ages)

#Vectorization
Hcu$ages /2
Hcu$ages ** 2

#Control Flow + Function
addsub_three_no <- function(a,b,c){
  return (a+b+c)
}

addsub_three_no(100,50,20)
addsub_three_no(1,2,3)

rm(addsub_three_no)

cube <- function(x,power=3) x**power
cube(4)
cube(5)
cube(5,power=4)

#if-else
detext <- function(x){
  if(x >= 6){
    print('OK')
  }else if(x >= 2){
    print('Not OK')
  }else{
    print('Not clear')
  }
}

df = read.csv('HCUAI3303.csv')

#url <- 'https:\\...'
#read.csv(url)
for(i in 1:10){
  print(i)
}
  
#install packages DataExplorer and tidyverse == packages install right corner
#load library
library(DataExplorer)
library(tidyverse)
library(forcats)

gss_cat
gss_cat %>% glimpse() #see about data,that know datatype row col
gss_cat %>% introduce() #say continuous discrete or missing values
gss_cat %>% plot_intro() #plot introduce
gss_cat %>% plot_missing() #missing for  any attibute
gss_cat %>% profile_missing() #describe attibute
gss_cat %>% plot_density() #plot numeric curve
gss_cat %>% plot_histogram() #plot numeric bar
gss_cat %>% plot_bar() #categorical data
gss_cat %>% plot_correlation() #relation data

library(datasets)
mtcars
head(mtcars)
tail(mtcars)
head(mtcars,25)
nrow(mtcars)
ncol(mtcars)
str(mtcars)
summary(mtcars)
mtcars %>% plot_histogram()