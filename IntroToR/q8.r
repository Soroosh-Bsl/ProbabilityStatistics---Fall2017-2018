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
#call the function
top_dribblers()