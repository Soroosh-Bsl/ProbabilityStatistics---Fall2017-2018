#q7:
#iterates rows of dataframe if the condition is met then prints the name
for(x in 1:dim(my.dataframe)[1]){
    if(my.dataframe[x, "Rating"] >= 70 && my.dataframe[x, "Rating"] <= 90){
        print(my.dataframe[x, "Name"])
    }
}