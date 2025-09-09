# Author: Ricardo Barnes, Date: September 9,2025, Purpose: In class Assignment 

cars <- mtcars
training_data <- cars[1:16,]
test_data <- cars[17:32,]
regression_result <- lm(mpg ~ gear, data=training_data)
prediction_result <- predict(regression_result, test_data)
actual_prediction_values <- data.frame(cbind(actuals=training_data$mpg, predicteds= prediction_result))
actual_prediction_values


#Results
                    actuals predicteds
Chrysler Imperial    21.0   15.80000
Fiat 128             21.0   21.28571
Honda Civic          22.8   21.28571
Toyota Corolla       21.4   21.28571
Toyota Corona        18.7   15.80000
Dodge Challenger     18.1   15.80000
AMC Javelin          14.3   15.80000
Camaro Z28           24.4   15.80000
Pontiac Firebird     22.8   15.80000
Fiat X1-9            19.2   21.28571
Porsche 914-2        17.8   26.77143
Lotus Europa         16.4   26.77143
Ford Pantera L       17.3   26.77143
Ferrari Dino         15.2   26.77143
Maserati Bora        10.4   26.77143

Volvo 142E           10.4   21.28571
