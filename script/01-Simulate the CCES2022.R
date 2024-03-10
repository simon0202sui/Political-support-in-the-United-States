#### Preamble ####
# Purpose: Simulates the data of CCES22
# Author: Lin Dai
# Date: 10 February 2024
# Contact: dailin200007302gmail.com

#### Work space set up ####

install.packages("tidyverse")
install.packages("janitor")

#### load the package ####

library(tidyverse)
library(janitor)

#### Simulate data ####

set.seed(302)

simulated_CCES22_data <- data.frame(
  "birth_year" = round(runif(500, min = 1980, max = 2004)),
  "gender" = round(runif(500, min = 1, max = 2)),
  "education" = round(runif(500, min = 1, max = 6)),
  "race" = round(runif(500, min = 1, max = 6)),
  "region" = round(runif(500, min = 1, max = 10))
)

#### Convert gender, education, race, and region to integers ####
simulated_CCES22_data$gender <- as.integer(simulated_CCES22_data$gender)
simulated_CCES22_data$education <- as.integer(simulated_CCES22_data$education)
simulated_CCES22_data$race <- as.integer(simulated_CCES22_data$race)
simulated_CCES22_data$region <- as.integer(simulated_CCES22_data$region)

#### Save the file of simulate data ####

write.csv(simulated_CCES22_data, file = "simulated_CCES22_data.csv", row.names = FALSE)
