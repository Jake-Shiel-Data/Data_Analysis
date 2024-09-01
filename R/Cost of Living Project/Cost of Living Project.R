#---------------------------------------
#---------------------------------------
# Data Analysis - Cost of Living Dataset
#---------------------------------------
#---------------------------------------

#  Task: Data Analysis and Visualization with R 

# Objective: You will read the provided Excel file into R, perform statistical 
# analysis, and create visualizations to explore the data. 



#------------------------------
# 1. Setting Up the Environment 
#------------------------------

# Install Packages
install.packages("tidyverse")
install.packages("summarytools")
install.packages("readxl")
install.packages("ggplot2")
install.packages("conflicted")

# Load packages into the session
library(tidyverse) # For data manipulation and visualization
library(summarytools) # For generating detailed summaries
library(readxl)  # For reading Excel files
library(ggplot2) # For creating plots and visualizations
library(conflicted) # To manage conflicts between packages

#--------------------
# 2. Loading the Data
#--------------------
# Read the Excel File: Import the data from the Excel file.

# File path for data
file_path <- "C:/Users/Jake/Documents/Data Analysis/IT Data Bootcamp/Week 11 (R)/R - JustIT Project/Cost_of_Living_Index_by_Country_2024.xlsx"

# Read the data
data <- read_excel(file_path)

# View the first 3 rows of the dataset 
head(data) 

#-------------------------
# 3. Exploring the Dataset
#-------------------------
# Summarize the Dataset: Use `summarytools` to generate a summary of the dataset

# Generate a detailed summary of the dataset 
# Due to the conflict explicitly specify which package view is being used from using "package::view()"
# "%>%" The pipe operator from the `tidyverse` allows you to pass the result of one function to another. 
dfSummary(data) %>% summarytools::view()

# Check the structure of the data 
str(data)

#------------------------
# 4. Statistical Analysis
#------------------------
# Descriptive Statistics: Calculate the mean, median, and standard deviation 
# for columns like `Cost of Living Index`, `Rent Index`, and `Local Purchasing Power Index`. 


# Calculate basic descriptive statistics 
summary(data) 

# Calculate specific statistics for a column:
# The argument `na.rm = TRUE` tells R to ignore missing values (NA) in these calculations. 

# mean of cost of living index
mean_cost_of_living <- mean(data$`Cost of Living Index`, na.rm = TRUE)
print(paste("mean cost ofliving:",mean_cost_of_living))
# median of rent index
median_rent_index <- median(data$`Rent Index`, na.rm = TRUE)
print(paste("median of rent index:",median_rent_index))
# standard deviation of purchasing power index
sd_local_purchasing_power <- sd(data$`Local Purchasing Power Index`, na.rm = TRUE)
print(paste("standard deviation oflocal purchasing power:",sd_local_purchasing_power))

# Correlation Analysis: Explore the relationships between different indices, 
# such as `Cost of Living Index`, `Rent Index`, and `Local Purchasing Power Index`. 

# Calculate correlation matrix 
correlation_matrix <- cor(data %>% select(`Cost of Living Index`, `Rent Index`, `Local Purchasing Power Index`), use = "complete.obs") 
print(correlation_matrix) 

#----------------------
# 5. Data Visualization
#----------------------
# Create a histogram to visualize the distribution of `Cost of Living Index`.

# Specify the data and map the 'Cost of Living Index' to the x-axis
ggplot(data, aes(x = `Cost of Living Index`)) + 
  # Add a histogram layer with specified bin width, fill color, and border color
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +   
  
  # Add a title to the plot
  labs(title = "Histogram of Cost of Living Index",
       # Label the x-axis
       x = "Cost of Living Index",
       # Label the y-axis (showing frequency of values)
       y = "Frequency")                                            

# Create a boxplot to visualize the spread and outliers of `Rent Index`

ggplot(data, aes(y = `Rent Index`)) + 
  # Add a boxplot layer with specified fill colour
  geom_boxplot(fill = "lightblue") + 
  # Add a title(Boxplot of Rent Index) and label the y-axis (Rent Index)
  labs(title = "Boxplot of Rent Index", y = "Rent Index") 


# Create a scatter plot to visualize the relationship between 'Cost of Living Index' and 'Local Purchasing Power Index'

# Map 'Cost of Living Index' to the x-axis and 'Local Purchasing Power Index' to the y-axis
ggplot(data, aes(x = `Cost of Living Index`, y = `Local Purchasing Power Index`)) +  
  # Add points to the scatter plot, setting their color to dark red
  geom_point(color = "darkred") +   
  # Add a title to the plot
  labs(title = "Scatter Plot of Cost of Living Index vs Local Purchasing Power Index", 
       # Label the x-axis
       x = "Cost of Living Index",                                                    
       # Label the y-axis
       y = "Local Purchasing Power Index")                                            

#--------------------------------
# 6. Interpretation and Reporting
#--------------------------------
# Interpret Results: Based on the statistical analysis and visualizations, interpret the key findings.
# Descriptive Statistics: Summarize the central tendency, variability, and distribution of your data. 

# Central Tendency:
# - The Cost of Living Index has a mean of 43.6, indicating that, on average, the cost of living in the countries represented is 
# about 43.6% relative to the highest index value.
# - The Rent Index has a much lower mean of 16.1, showing that rent prices are generally lower compared to the overall cost of living.
# - The Local Purchasing Power Index varies greatly between countries, with a mean of 65.1, indicating that purchasing power is 
# generally high in some countries but very low in others.

# Variability:
# - The standard deviation for the Cost of Living Index is 16.1, suggesting moderate variability in the cost of living across countries.
# - The Rent Index shows a significant spread with a standard deviation of 11.4, indicating that rent prices vary significantly from 
# country to country.
# - The Local Purchasing Power Index has a high standard deviation of 39.6, highlighting the vast differences in purchasing power
# across the countries.

# Correlation: Discuss any significant correlations and their implications. 

# The correlation matrix shows the relationships between key indices:
# - There is a positive correlation(0.82) between the `Cost of Living Index` and the `Rent Index`, suggesting that countries with higher 
# living costs tend to have higher rent prices.
# - A moderate correlation(0.69) is observed between the `Cost of Living Index` and the `Local Purchasing Power Index`. This indicates 
# that in some countries with a high cost of living, residents might also have a higher purchasing power, but this relationship is not 
# as strong.

# Visual Insights: Explain the patterns and outliers observed in the visualizations. 

# - The histogram of the `Cost of Living Index` shows the distribution of cost of living across different countries. Most countries have 
# a cost of living index between 30 and 50, indicating that many countries have moderate living costs.
# - The boxplot of the `Rent Index` reveals significant outliers(>40), suggesting that a few countries have exceptionally high rent prices 
# compared to others.
# - The scatter plot illustrates the relationship between the `Cost of Living Index` and the `Local Purchasing Power Index`. The plot 
# shows some clustering, with a few countries having both high living costs and high purchasing power, while others have low values 
# for both.
#---------------
#  7. Conclusion 
#---------------
# Summary of Findings: Provide a concise summary of what the analysis reveals about the data. 

# - The analysis reveals significant variability in the cost of living, rent, and purchasing power across different countries.
# - Countries with higher costs of living often have higher rent prices, but this does not always translate to higher local purchasing power.
# - The data indicates that while some countries are expensive to live in, they also provide higher purchasing power, balancing the cost 
# of living.

# Discussion: Suggest further analysis or actions based on the findings. 

# Further Analysis: It would be beneficial to explore the relationship between these indices and other factors such as GDP per capita, 
# average income, or inflation rates in each country.'







