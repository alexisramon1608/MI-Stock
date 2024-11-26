# mutual_information_stock.R
# This script calculates the mutual information between the daily open prices of two stocks.

# Install and load necessary packages
if (!require("quantmod")) install.packages("quantmod")
if (!require("infotheo")) install.packages("infotheo")
if (!require("dplyr")) install.packages("dplyr")

library(quantmod)
library(infotheo)
library(dplyr)

# Function to fetch stock data
get_stock_data <- function(symbol, start_date, end_date) {
  stock_data <- getSymbols(symbol, src = "yahoo", from = start_date, to = end_date, auto.assign = FALSE)
  stock_data <- Cl(stock_data) # Use Closing Price
  return(stock_data)
}

# Calculate Mutual Information between two stock open prices
calculate_mutual_information <- function(stock1_data, stock2_data) {
  # Preprocess: Remove missing values and align data
  combined_data <- merge(stock1_data, stock2_data, all = FALSE)
  stock1_prices <- as.numeric(combined_data[, 1])
  stock2_prices <- as.numeric(combined_data[, 2])

  # Discretize the continuous prices (binning)
  stock1_discretized <- discretize(stock1_prices, method = "equalwidth", nbins = 10)
  stock2_discretized <- discretize(stock2_prices, method = "equalwidth", nbins = 10)
  
  mi_value <- mutinformation(stock1_discretized, stock2_discretized)
  return(mi_value)
}

# Main execution
stock_symbol_1 <- "AAPL"
stock_symbol_2 <- "MSFT"
start_date <- "2020-01-01"
end_date <- Sys.Date()

# Fetch data
stock1_data <- get_stock_data(stock_symbol_1, start_date, end_date)
stock2_data <- get_stock_data(stock_symbol_2, start_date, end_date)

# Calculate Mutual Information
mi_result <- calculate_mutual_information(stock1_data, stock2_data)

# Output the result
cat("The Mutual Information between", stock_symbol_1, "and", stock_symbol_2, "is:", mi_result, "\n")
