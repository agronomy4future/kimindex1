#' Calculate Grain Area from Grain Weight (Kim Index1) of Bread Wheat
#'
#' This function predicts the grain area (mm2) for wheat based on the grain weight (mg)
#' using the equation y = exp(log(x)/1.32), where y is the grain area and x is the grain weight.
#'
#' @param data A data frame containing the grain weight
#' @param weight_col The name of the column in the data frame that contains the grain weight. This name can be any column that holds the grain weight data.
#' @return The input data frame with an additional column `predicted_area` representing the predicted individual grain area from each grain weight.
#' @export
#' @examples
#' predicted_grain_area= kim_index1(data, "grain_weight", remove_na= FALSE OR TRUE)
#'
# Function to predict grain weight from area (kimindex)
kimindex1= function(data, weight_col, remove_na= FALSE) {

  # Load necessary libraries
  library(dplyr)

  # Convert the weight column to numeric (if not already)
  data[[weight_col]]= as.numeric(data[[weight_col]])

  # Calculate the grain area using the equation x = exp(log(y)/1.32)
  data= data %>%
    mutate(predicted_area= exp(log(.data[[weight_col]]) / 1.32))

  # If remove_na is TRUE, discard rows with NA in predicted_area
  if (remove_na) {
    data= data %>%
      filter(!is.na(predicted_area))
  }

  # Return the modified data frame
  return(data)
}
