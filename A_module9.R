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

# Examine the dataset
?msleep  # Inquiry the help file on this data. It is a data frame with 83 rows and 11 variables
str(msleep)  # Data frame appears to be a table, with character and number variables, NAs are present
head(msleep) # Header shows column names



## Find the number of unique diet types
length(unique(msleep$vore)) # There are 5 diet types
unique(msleep$vore)  # But one diet type is an "NA" 
sum(is.na(msleep$vore))  # Seven samples have an "NA" diet type
length(unique(na.omit(msleep$vore))) # Number of diet types, excluding "NA"
## There are 4 listed diet types if we exclude NAs from our consideration



## Make a boxplot comparing the daily sleep totals across the vore categories
# Make sure we have a single panel 
par(mfrow = c(1,1))  

# Limit data for plot to where we have "vore" data (i.e. exclude rows with NA in the vore column)
PlotData <- msleep[!is.na(msleep$vore), ]

# Create plot
boxplot(PlotData$sleep_total ~ PlotData$vore, ylab = "Total Sleep (hrs)",
        xlab = "Diet Type", main = "Daily Sleep by Diet Type")

## Pattern description
# While the total sleep disturbution for all diet types overlap, the mean sleep for insectivores is notably higher (~18 hours)
# compared to the other three diet types (carnivore, herbivore, and omnivore), which all have mean sleep totals around 10 hours.
# Omnivores were found to have smallest interquartile range, and the only outliers in the plot were also found within this diet type.







#(2)	Using the mammal sleep dataset, use plot() to show the relationship between the natural log of body size
## and the length of the sleep cycle, labelling axes appropriately.  Using ggplot(), produce this same plot, but
## with a separate panel for each conservation status, excluding species that do not have data for all variables,
## and including a trend line for each by adding “+ stat_smooth(method="lm", se=F)“ to your ggplot code. Do the 
## species within each conservation status appear to show the same relationship between weight and sleep cycle 
##length? Consider whether your conclusions are justified by the data.


## Create plot using "plot"
# Make sure we have a single panel 
par(mfrow = c(1,1))  

#Plot sleep cycle (y) vs the natural log of body weight (x) using 'plot' 
plot(log(msleep$bodywt), msleep$sleep_cycle, pch = 19, xlab = "Body Weight [ln(kg)]",
     ylab = "Sleep Cycle Length (hrs)")



## Create plot using ggplot, but have a separate panel for each conservation status
# Limit the msleep dataset to only where we have data for body size, sleep cycle, and conservation status
GGData <- msleep[!is.na(msleep$bodywt) & !is.na(msleep$sleep_cycle) & !is.na(msleep$conservation), ]

# See how many rows we are left with
dim(GGData)  
# Left with 21 rows

# How many conservation types are there?
length(unique(GGData$conservation))
# 5 conservation types


#Load ggplot2
library(ggplot2)


ggplot(data = GGData, aes(x = log(GGData$bodywt), y = GGData$sleep_cycle, group = conservation, color = conservation)) + 
  geom_point() +
  facet_wrap( ~ conservation) + 
  ggtitle("Sleep Cycle Length vs. Body Weright for Conservation Statuses") +
  labs(x = "Body Weight [ln(kg)]", y = "Sleep Cycle Length (hrs)") +
  stat_smooth(method = "lm", se = F) 


ggplot(data = msleep, aes(x = log(msleep$bodywt), y = msleep$sleep_cycle)) +  
         xlab("Body Weight [ln(kg)]") + ylab("Sleep Cycle Length (hrs)")


ggplot(data = TimeData, aes(x = year, y = n)) + geom_line(aes(color = species_id), size = 1.5) +
  xlab("Year") + ylab("Number of Individuals Sampled") + scale_color_discrete(name ="Species") + 
  ggtitle("Time Series of Rodent Species' Samples")


# (3)	How does the ratio of brain weight to body weight (i.e., brainwt/bodywt) vary by diet type? Write a function
## called brain_body_ratio() that returns a dataframe with a row for each diet type (i.e., vore) category, and
## three columns named “vore”, “brain_body_mean”, and “brain_body_se”, where “brain_body_mean” contains the mean 
## brain-to-body weight ratio within a vore category, and “brain_body_se” contains the standard error for the 
##brain-to-body weight ratio within a vore category.

#Creat standard error function that includes NA removal for ease of use
se <- function(x, na.rm=FALSE) {
  if(na.rm == TRUE) x <- na.omit(x)
  sd(x)/sqrt(length(x))
}

# Create function with inputs x = diet type, y =  brain weight, and z = body weight
brain_body_ratio <- function(x,y,z){
  
  # Calculate mean brain to body weight ratio for each diet type category, ignore NA's
  BBR <- aggregate(y/z, list(x), mean, na.rm = T)
  
  # Rename column headers
  colnames(BBR) <- c("vore","brain_body_mean")
  
  # Calculate the standard error 
  BBR2 <- aggregate(y/z, list(x), se, na.rm = T)
  
  #Add standard error to BBR
  BBR$brain_body_se <- BBR2[,2]
  
  # Return the result BBR (brain-to-body weight ratio)
  return(BBR)
  
}

## Apply function to our data
# Input diet, brain weight, and body weight into function
BBRatio <- brain_body_ratio(msleep$vore,msleep$brainwt,msleep$bodywt)

#Examine output
BBRatio



# Member contributions:
