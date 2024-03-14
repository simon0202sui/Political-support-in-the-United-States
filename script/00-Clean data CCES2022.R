#### Preamble ####
# Purpose : clean the data of CCES22_Common_OUTPUT_vv_topost.dta
# Author : Lin Dai Pengyu Sui
# Email : dailin20000730@gmail.com
# Date : 9 Mar 2024

#### Install the package ####

install.packages("dplyr")

#### Set up workspace ####

library(dplyr)
library(readr)

#### Read the data ####

CCES22_Common_OUTPUT_vv_topost <- read_csv("CCES22_Common_OUTPUT_vv_topost.csv")
View(CCES22_Common_OUTPUT_vv_topost)
data <- CCES22_Common_OUTPUT_vv_topost

#### state the variable and make them together ####

selected_columns <- data[, c("birthyr", "gender4", "educ", "race","region" )]

#### Download the data ####

write.csv(selected_columns, file = "clean_CCES22.csv", row.names = FALSE)

