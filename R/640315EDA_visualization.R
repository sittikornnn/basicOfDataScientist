# install.packages("DataExplorer","tidyverse")
# load library
library(DataExplorer)
library(tidyverse)

library(forcats)
gss_cat
gss_cat %>% glimpse() 
gss_cat  %>% introduce()
gss_cat %>% plot_intro() 
gss_cat %>% plot_missing() 
gss_cat %>% profile_missing() 
gss_cat  %>% plot_density()
gss_cat  %>% plot_histogram()
gss_cat  %>% plot_bar() 
gss_cat  %>% plot_correlation() 

#----------------------
# install.packages("DataExplorer","tidyverse")
# load library
library(tidyverse)
library(datasets)
data()          # Data sets in package ‘datasets’

#----------------------
# Motor Trend Car Road Tests
#----------------------
mtcars          # load built-in data
str(mtcars)     # view structure
?mtcars         # view documentation 

#----------------------
head(mtcars)
tail(mtcars)
head(mtcars, 25)
nrow(mtcars)
ncol(mtcars)

#----------------------
# Running individual summary functions
min(mtcars$mpg)     # [, 1]	mpg	Miles/(US) gallon
mean(mtcars$mpg)
median(mtcars$mpg)
max(mtcars$mpg)
quantile(mtcars$mpg)
quantile(mtcars$mpg, probs = c(0.25,0.75))    # use option

#----------------------
#SHORTCUT: summary() function
summary(mtcars)      
summary(mtcars$mpg)       # Input a vector
summary(mtcars[, 1:3])    # Input a data frame

#----------------------
# table()
mtcars$cyl      # [, 2]	cyl	Number of cylinders
mtcars$am       # [, 9]	am	Transmission (0 = automatic, 1 = manual)
table(mtcars$cyl)           # input 1 vector
table(mtcars$cyl,mtcars$am) # input 2 vector
table(Cylinders = mtcars$cyl, Manual = mtcars$am)  # set labels
table(mtcars[, c('cyl','am')])  # input data frame

#----------------------
# Plotting Functions 
# Base R functions
# boxplot(), hist(), barplot(), plot()
#----------------------
# Boxplot
boxplot(mtcars$mpg)
boxplot(mtcars$mpg, main='Miles per Gallon')
boxplot(mtcars$hp)
# A formula as an argument "\mpg conditional on cyl"
boxplot(mpg ~ cyl, data = mtcars, 
        main = "Miles per Gallon by Number of Cylinders", 
        xlab = "Cylinders", 
        ylab = "Miles per Gallon")

boxplot(mpg ~ cyl + am, data = mtcars, 
        main = "MPG by Number of Cylinders & Transmissions")

#----------------------
# Histogram
# (Takes a vector, and plots the distribution of values)

hist(mtcars$mpg)
mtcars  %>% plot_histogram()
mtcars$mpg %>% plot_histogram()
#----------------------
# Bar Chart
# (Use the table function to create a two-way frequency table, and plotting options to group bars)

counts <- table(mtcars$cyl, mtcars$am)
colnames(counts) <- c("Auto", "Manual")
barplot(mtcars$mpg)
barplot(counts, 
        main = "Number of Cars by Transmission and Cylinders", 
        xlab = "Transmission", 
        beside = TRUE, 
        legend = rownames(counts))

#----------------------
# Scatterplot
plot(mtcars$mpg, mtcars$hp, 
     xlab = "Miles per Gallon", 
     ylab = "Horsepower")

# create a vector for conditional color coding
colorcode <- ifelse(mtcars$am == 0, "red", "blue")
plot(mtcars$mpg, mtcars$hp, 
     xlab = "Miles per Gallon", 
     ylab = "Horsepower", 
     col = colorcode)

#----------------------
#ggplot package
#----------------------
# Biochemical Oxygen Demand
#----------------------
BOD
?BOD         # view documentation 
ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+
  geom_point(size = 5)+
  geom_line(colour = 'red')

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand))+
  geom_point(size = 3)+
  geom_line(color = 'red')

ggplot(BOD,
       mapping = aes(Time, demand))+
  geom_point(size = 3)+
  geom_line(colour = 'red')

#----------------------
# Carbon Dioxide Uptake in Grass Plants
#----------------------
CO2
View(CO2)
?CO2
names(CO2)

CO2 %>%
  ggplot(aes(conc,uptake,color=Treatment))+
  geom_point(size=3,alpha=0.7)+
  geom_smooth(method = 'lm',se = F)+
  facet_wrap(~Type)+
  labs(title = 'Concentration of co2')+
  theme_minimal()
  
  
CO2 %>% 
  ggplot(aes(conc, uptake, colour =Treatment))+
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = lm, se = F) + 
  facet_wrap(~Type)+
  labs(title = 'Concentration of co2')+
  theme_bw()

CO2 %>% 
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5,
             aes(size = conc, colour = Plant))+
  facet_wrap(~Type)+
  coord_flip()+
  theme_bw()+
  labs(title = 'Chilled Vs Non-chilled')

#----------------------
mpg %>% 
  ggplot(aes(displ, cty))+
  geom_point(aes(colour = drv, size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow = 1)+
  labs(x = 'Engine size',
       y = 'MPG in the city',
       title = 'Fuel efficiency')+
  theme_bw()

#----------------------
# Datasets
starwars
?starwars
#-------
names(starwars)
glimpse(starwars)
summary(starwars)
plot_missing(starwars) #missing have species,gender,sex,hair_color,height,homeworld,mass,birth_year
#--------try to see of data
table(starwars$sex)
table(starwars$gender)
table(starwars$eye_color)
# do number 2 
#-----see eye for each sex
df <- table(starwars$sex,starwars$eye_color)
col_bar <- ifelse(starwars$sex == 'male', "red",ifelse(starwars$sex == 'female',"blue","grey"))
  
barplot(df,
        main = "Number of sex by each dolor of eye", 
        xlab = "color of eye", 
        beside = TRUE, 
        legend = rownames(df),
        col=col_bar)
#species plot relationship of hight and weight
table(starwars$species == 'Human')
starwars %>% 
  ggplot(aes(height,mass,color=gender))+
  geom_point(size = 3, alpha = 0.7)+
  geom_smooth(method = lm)+
  facet_wrap(~sex)



#do number 1
Region <- c('North','Northwest','East','East Central','Southwest','Southeast','South Central','West')
Sales <- c(300,233,335,411,194,168,590,372)
Share <- c("13%","10%","12%","15%","8%","10%","18%","12%")
Growth <- c(2.3,-0.4,-1.0,4.0,0.2,-2.1,3.5,1.8)
FTE <- c(12,11,14,17,9,5,24,14)
sales <- data.frame(Region,Sales,Share,Growth,FTE)

#do chart highlight
highlight_color = ifelse(sales$Growth < 0,"red","green")
barplot(sales$Growth~sales$Region,
        main = "percentage of sales Growth", 
        xlab = "Region", 
        ylab = "sales Growth",
        beside = TRUE, 
        legend = rownames(sales$Region),
        col=highlight_color)
