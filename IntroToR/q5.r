#q5:
#iterates rows of dataframes if nationality is "Italy" then prints the name
for(x in 1:dim(my.dataframe)[1]){
    if(my.dataframe[x, "Nationality"] == "Italy"){
        print(my.dataframe[x, "Name"])
    }    
}