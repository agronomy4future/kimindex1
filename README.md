<!-- README.md is generated from README.Rmd. Please edit that file -->

# kimindex

<!-- badges: start -->
<!-- badges: end -->

The goal of kimindex1 package is to predict grain area (mm2) from weight (mg) in bread wheat.

□ Code summary: https://github.com/agronomy4future/r_code/blob/main/Copy_of_Prediction_of_Grain_Area_and_Weight_in_Bread_Wheat_(feat_kimindex1).ipynb

□ Code explained: https://agronomy4future.org/archives/23118

## Installation

You can install the development version of fwrmodel like so:

Before installing, please download Rtools (https://cran.r-project.org/bin/windows/Rtools)

``` r
if(!require(remotes)) install.packages("remotes")
if (!requireNamespace("kimindex1", quietly = TRUE)) {
  remotes::install_github("agronomy4future/kimindex1")
}
library(remotes)
library(kimindex1)
```

## Example

This is a basic code to predict grain area from grain weight:

``` r
predicted_area= kimindex1(data, "grain_weight", remove_na= TRUE)

■ remove_na= TRUE: excluding missing values
■ remove_na= FALSE: including missing values
```

## Let’s practice with actual dataset

``` r
# to uplaod data
if(!require(readr)) install.packages("readr")
library(readr)
github="https://raw.githubusercontent.com/agronomy4future/raw_data_practice/main/Philipp_et_al_2018.csv"
df = data.frame(read_csv(url(github), show_col_types=FALSE))

head(df,5)
  grain_weight_mg grain_area_mm2
1           49.08           18.6
2           45.43           18.3
3           41.78           16.7
4           53.42           20.3
5           44.40           17.5
.
.
.

# to predict grain area from weight
predicted_area= kimindex1(df, "grain_weight_mg", remove_na= TRUE)

head(predicted_area,5)
  grain_weight_mg grain_area_mm2 predicted_area
1           49.08           18.6       19.09802
2           45.43           18.3       18.01203
3           41.78           16.7       16.90466
4           53.42           20.3       20.36416
5           44.40           17.5       17.70180
.
.
.
```
