# Mutual Information Calculation Between Stock Open Prices

This R project calculates the Mutual Information (MI) between the daily open prices of two stocks. The MI metric is a way to measure the statistical dependency between two random variables.

## Requirements

- R (version 4.0.0 or higher)
- `quantmod` package for fetching stock data
- `infotheo` package for computing mutual information
- `dplyr` package for data manipulation

You can install the necessary packages by running the following commands in your R console:

```r
install.packages("quantmod")
install.packages("infotheo")
install.packages("dplyr")
