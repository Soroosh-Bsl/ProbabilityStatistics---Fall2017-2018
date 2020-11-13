#q9:
#creates vectors for positions , birth days, and power(ratings) of spanish players
position_of_spanish_vector <- vector()
birth_of_spanish_vector <- vector()
power_vector <- vector()

#number_of_spanish holds number of spanish players
number_of_spanish <- 0

#iterates rows of dataframe if the nationality is "Spain" adds one to the number of spanish players and adds its positions and birth day to the related vectors also adds the rating to the vector. 
for(x in 1:dim(my.dataframe)[1]){
    if(my.dataframe[x, "Nationality"] == "Spain"){
        number_of_spanish <- (number_of_spanish) +1
        position_of_spanish_vector <- c(position_of_spanish_vector, as.character(my.dataframe[x, "Club_Position"]))
        power_vector <- c(power_vector, my.dataframe[x, "Rating"])
        birth_of_spanish_vector <- c(birth_of_spanish_vector, as.character(my.dataframe[x, "Birth_Date"]))
    }    
}
#finally creates the list and adds the vectors and others
list <- list(number_of_spanish, position_of_spanish_vector, birth_of_spanish_vector, mean(power_vector))
