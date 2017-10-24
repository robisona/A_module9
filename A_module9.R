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







#(2)	Using the mammal sleep dataset, use plot() to show the relationship between the natural log of body size
## and the length of the sleep cycle, labelling axes appropriately.  Using ggplot(), produce this same plot, but
## with a separate panel for each conservation status, excluding species that do not have data for all variables,
## and including a trend line for each by adding “+ stat_smooth(method="lm", se=F)“ to your ggplot code. Do the 
## species within each conservation status appear to show the same relationship between weight and sleep cycle 
##length? Consider whether your conclusions are justified by the data.







# (3)	How does the ratio of brain weight to body weight (i.e., brainwt/bodywt) vary by diet type? Write a function
## called brain_body_ratio() that returns a dataframe with a row for each diet type (i.e., vore) category, and
## three columns named “vore”, “brain_body_mean”, and “brain_body_se”, where “brain_body_mean” contains the mean 
## brain-to-body weight ratio within a vore category, and “brain_body_se” contains the standard error for the 
##brain-to-body weight ratio within a vore category.






# Member contributions:
