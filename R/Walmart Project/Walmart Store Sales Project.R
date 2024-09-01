#------------------------------------
# Data Analysis - Walmart Store Sales
#------------------------------------

# Objective: 
# Analyze Walmart store sales data to practice R programming skills, including data manipulation, statistical analysis, and 
# data visualization. 

#-----------------------------------  
# 1. Setting Up the Environment 
#-----------------------------------

# 1a Install and load the necessary packages: 
install.packages("tidyverse") 
install.packages("summarytools") 
install.packages("readxl") 
install.packages("ggplot2") 
install.packages("dplyr")
install.packages("conflicted")
install.packages("forecast")

# 1b Load packages into the session
library(tidyverse) # For data manipulation and visualization
library(summarytools) # For generating detailed summaries
library(readxl)  # For reading Excel files
library(ggplot2) # For creating plots and visualizations
library(conflicted) # To manage conflicts between packages
library(dplyr)
library(forecast)

#--------------------
# 2. Loading the Data
#--------------------
# Read the CSV file: Import the data from the CSV file.

# File path for data
file_path <- "Your file path here"

# Read the data
data <- read_csv(file_path)

# View the first few rows of the dataset 
head(data)

#-------------------------
# 3. Exploring the Dataset
#-------------------------

# 3a Summarize the dataset: 
# Generate a summary using `dfSummary()`. 

dfSummary(data) %>% summarytools::view()

# Check the structure of the data 
str(data)

# 3b. Check for missing values: 
# Identify missing values using `summary(is.na())`. 
summary(is.na(data))

#------------------------
# 4. Statistical Analysis
#------------------------

# 4.1 Descriptive Statistics: 
# Calculate mean, median, and standard deviation for key financial columns. 

# Mean Weekly Sales
mean_sales <- mean(data$Weekly_Sales, na.rm = TRUE)
median_sales <- median(data$Weekly_Sales, na.rm = TRUE)
sd_sales <- sd(data$Weekly_Sales, na.rm = TRUE)

# Print results
cat("Mean Weekly Sales:", mean_sales, "\n")
cat("Median Weekly Sales:", median_sales, "\n")
cat("Standard Deviation of Weekly Sales:", sd_sales, "\n")

# 4.2 Correlation Analysis: 
# Create a correlation matrix for financial metrics. 

# Correlation matrix for financial metrics
correlation_matrix <- cor(data %>% select(Weekly_Sales, Temperature, Fuel_Price), use = "complete.obs")
print(correlation_matrix)

#----------------------
# 5. Data Visualization
#----------------------
# 5.1 Histogram: 
# Create a histogram to visualize `Weekly_Sales`. 

ggplot(data, aes(x = Weekly_Sales)) +
  geom_histogram(binwidth = 50000, fill = "blue", color = "black") +
  labs(title = "Histogram of Weekly Sales", x = "Weekly Sales", y = "Frequency")


# 5.2 Boxplot: 
# Generate a boxplot for `Weekly_Sales`. 

ggplot(data, aes(y = Weekly_Sales)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Boxplot of Weekly Sales", y = "Weekly Sales")

# 5.3 Scatter Plot: 
# Create a scatter plot for `Temperature` vs `Weekly_Sales`. 

ggplot(data, aes(x = Temperature, y = Weekly_Sales)) +
  geom_point(color = "darkred") +
  labs(title = "Scatter Plot of Temperature vs Weekly Sales", x = "Temperature", y = "Weekly Sales")

# 5.4 Time Series Plot: 
# Create a time series plot for `Weekly_Sales` over time.

# Convert date column to Date type if necessary
data$Date <- as.Date(data$Date, format = "%d-%m-%Y")

# Time series plot of Weekly Sales over time
ggplot(data, aes(x = Date, y = Weekly_Sales)) +
  geom_line(color = "blue") +
  labs(title = "Time Series Plot of Weekly Sales Over Time", x = "Date", y = "Weekly Sales")

#--------------------------------
# 6. Interpretation and Reporting
#--------------------------------

# 6.1 Interpret the results: 
# Summarize the findings from the statistical analysis and visualizations.
