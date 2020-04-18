library(arules)
library(car)
library(carData)
library(mvinfluence)
library(recommenderlab)
library(ggplot2)
library(data.table)
library(reshape2)
library(caTools)

#download data
View(book)

#MetaData
str(book)

book$User.ID <- as.factor(book$User.ID)

book$Book.Rating <- as.factor(book$Book.Rating)

booknew <- as(book,"transactions")

#rating distribution

itemFrequencyPlot(booknew,topN=25)
View(book)

#the datatype should be realRatingMatrix inorder to build recommendation engine
book_matrix <- as(booknew, "binaryRatingMatrix")

#Popularity based 
model <- Recommender(book_matrix, method="POPULAR")
model

#Predict For Other Users
recommended_items <- predict(model, book_matrix[110:120], n=3)
as(recommended_items, "list")

#User Based Collaborative Filtering
model1 <- Recommender(book_matrix,method = "UBCF")
model1

#Predict for 3 Users
recommended_items1 <- predict(model1,book_matrix[101:103],n=3)
as(recommended_items1,"list")

#Item based Collaborative Filtering
model2 <- Recommender(book_matrix,method = "IBCF")
model2

#Predict 
recommended_items2 <- predict(model2,book_matrix[110:115],n=3)
as(recommended_items2,"list")