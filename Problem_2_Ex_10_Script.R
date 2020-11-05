#Exercise 10 Problem 2
#By: Joseph Day

#Importing the data in "data.txt" and importing appropriate libraries

setwd("C:/Users/jday7/Onedrive/Desktop/Biocomputing2020_Tutorial12")

data <- read.csv("data.txt", header = TRUE)

library(ggplot2)
library(cowplot)

#Creating our first plot. A barplot of the 4 means of the regions
#Creating a dataframe for the mean of each region first

north <- data[data$region == "north",]
east <- data[data$region == "east",]
west <- data[data$region == "west",]
south <- data[data$region == "south",]

means <- c(mean(north$observations), mean(east$observations), mean(south$observations), mean(west$observations))

bar_plot_data <- data.frame("region" = unique(data$region), "means" = means)

#Saving our plot

bplot <- ggplot(bar_plot_data, aes(x = region, y = means)) +
  stat_summary(geom = "bar")

#Moving onto plot number 2, a scatter plot

splot <- ggplot(data, aes(x = region, y = observations)) +
  geom_point() +
  geom_jitter()

#Adding the two plots together, and displaying them

fig <- plot_grid(bplot, splot)

fig

#Answer to the question:

#The barplot shows a story where the each region's observations averages are nearly identical. It seems like their is no difference among the regions.
#The scatterplot tells a story of how different the data varies. While they average out to be the same, each region has a unique distribution of data with different variances

#Ultimately, the two plots tell a different story because they represent data in different ways. A barplot compares direct specific values while a scatterplot allows one to look at the data as a whole. 