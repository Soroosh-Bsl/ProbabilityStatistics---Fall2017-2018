#q1:
#sets directory
setwd("C:/Users/lenovo/Desktop")
#reads the data file to my.dataframe
my.dataframe <- read.csv("FullData.csv")


#q2:
#print dimensios of dataframe
dim(my.dataframe)
#print names of columns
colnames(my.dataframe)


#q3:
my.dataframe[order(my.dataframe$Height), ]


#q4:
position_factor <- as.factor(my.dataframe$Club_Position)
levels(position_factor)


#q5:
#iterates rows of dataframes if nationality is "Italy" then prints the name
for(x in 1:dim(my.dataframe)[1]){
    if(my.dataframe[x, "Nationality"] == "Italy"){
        print(my.dataframe[x, "Name"])
    }    
}


#q6:
#iterates cols of dataframe is class of the first data of the col is numeric or integer then calculates the mean of it and print it
for(x in 1: dim(my.dataframe)[2]){
    if(class(my.dataframe[1, x]) == "numeric" || class(my.dataframe[1, x]) == "integer"){
        print(mean(my.dataframe[, x]))
    }
}


#q7:
#iterates rows of dataframe if the condition is met then prints the name
for(x in 1:dim(my.dataframe)[1]){
    if(my.dataframe[x, "Rating"] >= 70 && my.dataframe[x, "Rating"] <= 90){
        print(my.dataframe[x, "Name"])
    }
}


#q8:
#function
top_dribblers <- function(){
    #drib is a vector which is a copy of dribbling of all players
    drib <- my.dataframe$Dribbling
    #indices is the indices of players with the highest dribbling
    indices <- order(-drib)
    x <- 0
    
    #prints the name of first 10 players with the highest dribbling according to the indices stored in indices vector 
    repeat{
        x <- x+1
        if(x < 11){
            print(my.dataframe[indices[x], "Name"])
        }
        else{
            break()
        }
    }
    
}
#calls the function
top_dribblers()


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


#q10:
tapply(my.dataframe$Rating, as.factor(my.dataframe$Nationality), mean)


#q11:
#for the first 10 players sorted by date of joining the club (which shows the loyalty to the club) it will print the names
for(x in 1:10){
    print(my.dataframe$Name[order(as.character(my.dataframe$Club_Joining))][x])
}
