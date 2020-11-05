#Exercise 10 Problem 1
#By: Joseph Day

#First, import data on two variables from a text file. I've included the file I read into in this repository

#The data is two variables of average brain weight and body weight for different mammals

#Url:
#https://people.sc.fsu.edu/~jburkardt/datasets/regression/x01.txt

#Setting the working directory and importing the data

setwd("C:/Users/jday7/Onedrive/Desktop/Biocomputing2020_Tutorial12")

data <- read.csv("Brain_Body.txt", header = TRUE)

#Importing the needed packages

library(ggplot2)
library(cowplot)

#Creating our scatter plot

ggplot(data, aes(x = Brain_Weight, y = Body_Weight)) +
  geom_point() +
  
  #Making a theme
  theme_classic() +
  
  #Labeling Axis
  xlab("Brain Weight of Mammal") +
  ylab("Body Weight of Mammal") +
  
  #Adding a linear trend line
  stat_smooth(method = "lm")
