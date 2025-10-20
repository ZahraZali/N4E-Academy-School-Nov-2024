# Author: Juan Camilo Rivera-Palacio
# Goal: Examples of clustering learning analysis
# Project: NFDI4Earth Hackathon 11.2025 

# version.string R version 4.4.1 (2024-06-14 ucrt)


# Load libraries 

library(tidyverse)
library(caret)
# library(stringr)    
# library(readr)      
# library(patchwork)  
# library(reshape2)   
# library(rlang)      
# library(corrplot)   
# library(car)        
# library(caret)      
# library(pdp)        
# library(vip)        
# library(iml)        


#----------- Load dataset -----------------------------------
# Dataset source: https://github.com/ZahraZali/N4E-Academy-School-Nov-2024/blob/main/Dataset/aqi_dataset_positive.csv

data <- read.csv("aqi_dataset_positive.csv")

#----------- Clean and classify dataset ----------------------
# The statistical analysis of the variables is available in the file:
# Hackathon_prep_air_regression_v2.Rmd
# (See: https://github.com/ZahraZali/N4E-Academy-School-Nov-2024/tree/main/R)
# The fileter used is to omit rows with missing values in the dataframe
data <- data %>% na.omit()

# Classify the AQI according to https://github.com/ZahraZali/N4E-Academy-School-Nov-2024/blob/main/Dataset/Guide_dataset.md
data <- data %>% mutate(AQI_Descript = ifelse(AQI >= 0 & AQI <= 50, "Good",
                                       ifelse(AQI >= 51 & AQI <= 100, "Moderate",
                                       ifelse(AQI >= 101 & AQI <= 150, "Unhealthy_sensitive_groups",
                                       ifelse(AQI >= 151 & AQI <= 200, "Unhealthy",
                                       ifelse(AQI >= 201 & AQI <= 300, "Very_unhealthy", "Hazardous"))))))

data$AQI_Descript <- as.factor(data$AQI_Descript)
data <- data %>%select(!AQI)


#--------Classifier Models------------------------------------

set.seed(10)                                                              # set seed reproducible
train_test_split <- sample(1:nrow(data ), 0.8 * nrow(data ), replace = FALSE) # randomly select 80% of row indices for training
data_train <- data[train_test_split, ]                                     # training set
data_test  <- data[-train_test_split, ]                                    # hold‑out test set comprising the remaining rows


tc = trainControl(method = "cv" , number = 5)                         #  5‑fold cross‑validatioy for model training

#--------Models---------------------------------------------
# Random Forest
model.rf   = caret::train(AQI_Descript ~ ., data=data_train, method="rf", trControl=tc) 

# Decision Tree
model.cart   = caret::train(AQI_Descript ~ ., data=data_train, method="ctree", trControl=tc)

#test the model performance
pred.rf   <- predict(model.rf, data_test) 
pred.cart <- predict(model.cart, data_test) 
 


#----------------Confusion Matrix------------------------------
# Here we plot the confusion matrix for each model. 
conf_rf <- confusionMatrix(pred.rf, data_test$AQI_Descript)
print(conf_rf)
conf_cart <- confusionMatrix(pred.cart, data_test$AQI_Descript)
print(conf_cart)


cm_tbl <- table(Truth = data_test$AQI_Descript, Pred = pred.rf)
cm_norm <- prop.table(cm_tbl, margin = 1) %>% as.data.frame()

ggplot(cm_norm, aes(x = Pred, y = Truth, fill = Freq)) +
  geom_tile(color = "white") +
  geom_text(aes(label = scales::percent(Freq, accuracy = 0.1)), size = 3) +
  scale_fill_gradient(low = "white", high = "steelblue") +
  labs(title = "Matrix Confusion Ranfom Forest",
       x = "Predicción", y = "Verdad") +
  theme_bw()


pred_df_all <- data.frame(
  truth = data_test$AQI_Descript,
  pred  = pred.rf
)

# Balance of the labels. True and Predict. 

p_truth <- ggplot(pred_df_all, aes(x = truth)) +
  geom_bar(fill = "grey70", color = "black") +
  labs(title = "Distribución de clases (verdad - test)", x = "Clase", y = "Frecuencia") +
  theme_bw()

p_truth
p_pred <- ggplot(pred_df_all, aes(x = pred)) +
  geom_bar(fill = "grey50", color = "black") +
  labs(title = "Distribución de clases (predicho - test)", x = "Clase", y = "Frecuencia") +
  theme_bw()

p_pred



focus_classes <- c("Moderate", "Unhealthy")
pred_df_mu <- pred_df_all %>%
  dplyr::bind_cols(data_test) %>%
  dplyr::filter(truth %in% focus_classes, pred %in% focus_classes) %>%
  dplyr::mutate(status = dplyr::if_else(truth == pred, "Correct", "Misclassified"))

# Variables candidatas (ajusta a tus nombres reales disponibles)
vars_candidatas <- c("humidity", "temperature", "wind_speed", "industrial_activity")
vars_candidatas <- intersect(vars_candidatas, names(data_test))  # por si alguna no existe

# Boxplots por variable para ver rangos que inducen error
plots_box <- purrr::map(vars_candidatas, function(vv) {
  ggplot(pred_df_mu, aes(x = status, y = .data[[vv]], fill = truth)) +
    geom_boxplot(outlier.alpha = 0.4) +
    labs(title = paste0("Moderate vs Unhealthy — ", vv),
         x = "Estado (Correct/Misclassified)", y = vv) +
    theme_bw() +
    theme(legend.position = "bottom")
})

plots_box 
