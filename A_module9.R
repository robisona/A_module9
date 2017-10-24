# A_module9.R
# Module assignment for NR 995 Group A Module 9
# Drew Robison, Korik Vargas, connor Breton
# Last updated 10/24/17


# (1)	The mammal sleep dataset is included in the ggplot2 package and provides information about the sleeping 
## habits of 83 species of mammals. Load the dataset (library(ggplot2); data(msleep); ?msleep). How many diet 
## type (i.e., vore) categories are there? Visually investigate whether daily sleep totals vary with diet type:
## Make a boxplot comparing the daily sleep totals across the vore categories, excluding rows that do not have 
## data in the vore column. Remember to include informative axis labels.Briefly describe in 1-2 sentences the 
## major patterns in the plot.

## Load the desired dataset
library(ggplot2)
data(msleep)

## Examine the dataset
?msleep  # Inquiry the help file on this data. It is a data frame with 83 rows and 11 variables
str(msleep)  # Data frame appears to be a table, with character and number variables, NAs are present
head(msleep) # Header shows column names

## Find the number of unique diet types
length(unique(msleep$vore)) # There are 5 diet types
unique(msleep$vore)  # But one of them is "NA" 
sum(is.na(msleep$vore))  # Seven samples diet types are listed at "NA" 
length(unique(na.omit(msleep$vore))) # There are 4 diet types if we exclude NAs

## There are 4 listed diet types if we exclude NAs from our consideration


## Create boxplot of sleep totals
boxplot(msleep$sleep_total ~ msleep$vore, ylab = "Total Sleep (hrs)",
        xlab = "Diet Type")

## PATTERN DESCRIPTION



#(2)	Using the mammal sleep dataset, use plot() to show the relationship between the natural log of body size
## and the length of the sleep cycle, labelling axes appropriately.  Using ggplot(), produce this same plot, but
## with a separate panel for each conservation status, excluding species that do not have data for all variables,
## and including a trend line for each by adding “+ stat_smooth(method="lm", se=F)“ to your ggplot code. Do the 
## species within each conservation status appear to show the same relationship between weight and sleep cycle 
##length? Consider whether your conclusions are justified by the data.


## Create plot using "plot"
plot(log(msleep$bodywt), msleep$sleep_cycle, xlab = "Body Weight [ln(kg)]",
     ylab = "Sleep Cycle Length (hrs)")


## Create plot using ggplot
ggplot(data = msleep, aes(x = log(msleep$bodywt), y = msleep$sleep_cycle))


ggplot(data = TimeData, aes(x = year, y = n)) + geom_line(aes(color = species_id), size = 1.5) +
  xlab("Year") + ylab("Number of Individuals Sampled") + scale_color_discrete(name ="Species") + 
  ggtitle("Time Series of Rodent Species' Samples")


# (3)	How does the ratio of brain weight to body weight (i.e., brainwt/bodywt) vary by diet type? Write a function
## called brain_body_ratio() that returns a dataframe with a row for each diet type (i.e., vore) category, and
## three columns named “vore”, “brain_body_mean”, and “brain_body_se”, where “brain_body_mean” contains the mean 
## brain-to-body weight ratio within a vore category, and “brain_body_se” contains the standard error for the 
##brain-to-body weight ratio within a vore category.






# Member contributions:
