# load a package every time you wish to use it
# this gives you access to the functions provided by that package, which 
#     are not available in the base functionality of R
library(ggplot2)

#read in data
mpg = read.table("mpg.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)

dim(mpg)

head(mpg)

#### scatter plot of two continuous variables 
##   displacement (engine size) vs. city miles per gallon (cty)
#   -the ggplot call creates a ggplot object, including
#        defining the dataframe containing our data
#    within the ggplot call, aes() specifies x and y components of our figure
#   -geom_point() specifies the particular appearance of the data in the plot
#   -the absence of any scale or label functions means we are using the defaults
#   -theme_classic() specifies a classic appearance for background and fonts

ggplot(data = mpg,aes(x = displ, y = cty)) +
  geom_point() +
  theme_classic()

# we can add function calls that change labels to use something other than the default
ggplot(data = mpg,aes(x = displ, y = cty)) + 
  geom_point() + 
  xlab("displacment (l)") + 
  ylab("miles per gallon-city") +
  theme_classic() 

# we can add more than one layer to a plot, including things like trend lines
ggplot(data = mpg,aes(x = displ, y = cty)) + 
  geom_point() + 
  stat_smooth(method="lm") +
  xlab("displacment (l)") + 
  ylab("miles per gallon-city") +
  theme_classic() 


# we can alter coloring of the points too.
# here are two ways of doing that
ggplot(data = mpg,aes(x = displ, y = cty, color=drv)) +
  geom_point() +
  stat_smooth(method="lm") +
  xlab("displacment (l)") + 
  ylab("miles per gallon-city") +
  theme_classic()

ggplot(data = mpg,aes(x = displ, y = cty)) +
  geom_point(aes(color=drv)) +
  stat_smooth(method="lm") +
  xlab("displacment (l)") + 
  ylab("miles per gallon-city") +
  theme_classic()


#### plots for a continuous and categorical variable 
##   city miles per gallon (cty) as a function of drive

# a bar chart often shows counts or averages of values across categories
# stat_summary() can be used to simultaneously calculate summary stats
#   and plot these summary stats 

# plot of average city mpg for each drive
ggplot(mpg, aes(x = drv, y = cty)) +
  stat_summary(fun = mean, geom = "bar") +
  xlab("drive of car") +
  ylab("miles per gallon-city") +
  theme_classic()

# a violin plot shows a distribution of the data, rather than only the mean, for a continuous variable across categories
ggplot(mpg, aes(x=drv, y=cty)) +
  geom_violin() +
  xlab("drive of car") +
  ylab("miles per gallon-city") +
  theme_classic()


# ggplot challenges

#1) for loop to plot violin plots, using species as categories, of each measurement in iris
iris=read.csv("iris.csv",header=TRUE,stringsAsFactors=FALSE)

for(i in 1:4){
  print(ggplot(data=iris,aes(x=Species,y=iris[,i])) +
  geom_violin() +
  ylab(colnames(iris)[i]))
}

#2)  bar plot of mean engine sizes (displ) for different numbers of cylinders;
# include standard error  error bars
ggplot(mpg, aes(x=cyl, y=displ)) +
  stat_summary(geom="bar", fun.y="mean") +
  stat_summary(geom="errorbar", fun.data = "mean_se", width=0.3) +
  ylab("Displacement (liters)") +
  xlab("Cylinders") +
  theme_bw()

#3) Density plot with a density line for sepal width of each species
ggplot(data=iris) +
  geom_density(aes(x=Sepal.Width,color=Species)) +
  theme_classic()

