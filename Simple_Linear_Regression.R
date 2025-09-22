
# Author: Ricardo Barnes, Date: August 28,2025, Purpose: Test simple linear progression 

#Get sample data 
cars <- mtcars 

#Scatter plot on training data 
scatter.smooth(x=cars$mpg, y=cars$disp, main="SpeedVSdistance")

#Calculate the correlation value between mpg and disp
cor(cars$mpg, cars$disp)

#split training and testing data for regression 
training_data <- cars[1:16,]
test_data <- cars[17:32,]

#Build regression Model
regression_results <- lm(mpg ~ disp, data=training_data)

# Predict regression in function on test data
prediction_results <- predict(regression_results, test_data)

#results of prediction 
actual_prediction_value <- data.frame(cbind(actuals=training_data$mpg,predicteds=prediction_results))