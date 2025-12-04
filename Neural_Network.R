#Author: Ricardo Barnes, Date: 11/06/2025, Purpose: Implement Neural Networks 

#Load Library Caret 
library(caret)

#Load simple Dataset 
dataset <- iris 

# 80% split for training data and 20% split for validation data 
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE) 
validation <- dataset[-validation_index,] 
dataset <- dataset[validation_index,]


# cross validations: 3, 5, 10-fold cross validations 
control <- trainControl(method="cv", number=10) 
metric <- "Accuracy"

set.seed(7) 
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl= control)

set.seed(7) 
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl= control)

# Summarizing accuracy of the LDA  models
results <- resamples(list(lda=fit.lda, rf=fit.rf)) 
summary(results)

# Based upon the accuracy values we choose lda model to do our predictions on the validation dataset 
predictions <- predict(fit.lda, validation) 
confusionMatrix(predictions, validation$Species)

#Confusion Matrix and Statistics

#            Reference
#Prediction   setosa versicolor virginica
# setosa         10          0        0
#  versicolor     0          10       0
# virginica       0          0        10

#Overall Statistics

#              Accuracy : 1          
#               95% CI : (0.8843, 1)
# No Information Rate : 0.3333     
# P-Value [Acc > NIR] : 4.857e-15  

#              Kappa : 1          

# Mcnemar's Test P-Value : NA         

#Statistics by Class:

#                   Class: setosa Class: versicolor Class: virginica
#Sensitivity                 1.0000            1.0000           1.0000
#Specificity                 1.0000            1.0000           1.0000
#Pos Pred Value              1.0000            1.0000           1.0000
#Neg Pred Value              1.0000            1.0000           1.0000
#Prevalence                  0.3333            0.3333           0.3333
#Detection Rate              0.3333            0.3333           0.3333
#Detection Prevalence        0.3333            0.3333           0.3333
#Balanced Accuracy           1.0000            1.0000           1.0000