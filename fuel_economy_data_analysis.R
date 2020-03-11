library(ggplot2)
library(h2o)

h2o.init()

df<-as.h2o(ggplot2::mpg)

df %>% glimpse()



predictors <- c("year", "displ", "cyl")
response <- "cty"

glm1 <- h2o.glm( x= predictors, y=response,
                        training_frame=df, lambda = 0, compute_p_values = TRUE)





# Coefficients that can be applied to the non-standardized data
h2o.coef(glm1)


# Coefficients fitted on the standardized data (requires standardize=TRUE, which is on by default)
h2o.coef_norm(glm1)


# Print the coefficients table
glm1@model$coefficients_table
# or show(prostate.glm@model$coefficients_table)

# Print the standard error
glm1@model$coefficients_table$std_error


# Print the p values
glm1@model$coefficients_table$p_value


# Print the z values
glm1@model$coefficients_table$z_value


# Retrieve a graphical plot of the standardized coefficient magnitudes
h2o.std_coef_plot(glm1)


h2o.performance(glm1)

#We have high rmse it means our model is not good enough
# 0.67 r2 is moderate 


