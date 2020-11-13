#q6:
#iterates cols of dataframe is class of the first data of the col is numeric or integer then calculates the mean of it and print it
for(x in 1: dim(my.dataframe)[2]){
    if(class(my.dataframe[1, x]) == "numeric" || class(my.dataframe[1, x]) == "integer"){
        print(mean(my.dataframe[, x]))
    }
}