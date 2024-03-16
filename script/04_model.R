#### Workspace setup ####
library(tidyverse)        # For data manipulation
library(rstanarm)         # For Bayesian regression models
library(modelsummary)     # For summarizing models

#### Read data ####
# Read the dataset from a CSV file into R
ces2020 <- read_csv("C:/Users/User/Desktop/Paper3/data_cleaned.csv")

ces2020$support_biden <- factor(ces2020$support_biden, levels = c("No", "Yes"))

### Model data ####
set.seed(321)  # Set seed for reproducibility

# Randomly sample 1000 observations to manage run-time
ces2020_reduced <- 
  ces2020 |> 
  slice_sample(n = 1000)

# Fit the Bayesian logistic regression model
biden_preference_model <-
  stan_glm(
    support_biden ~ gender + race + age_group,  
    data = ces2020_reduced,
    family = binomial(link = "logit"),  # Logistic regression for binary outcome
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),  # Priors for the coefficients
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),  # Prior for the intercept
    seed = 321  
  )

#### Save model ####
saveRDS(
  biden_preference_model,
  file = "C:/Users/User/Desktop/Paper3/biden_preference_model.rds"  # Saving the model to your specified path
)

# Summary of the Bayesian logistic regression model
modelsummary(biden_preference_model)
msummary(biden_preference_model)
# Plot the Bayesian logistic regression model's estimates with 90% credible intervals
plot(biden_preference_model) +
  labs(title = "Posterior Distributions of Model Parameters",
       subtitle = "90% Credible Intervals",
       x = "Parameter Estimates",
       y = "Variables")
