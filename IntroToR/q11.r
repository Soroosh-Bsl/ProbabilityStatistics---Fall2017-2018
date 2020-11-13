#q11:
#for the first 10 players sorted by date of joining the club (which shows the loyalty to the club) it will print the names
for(x in 1:10){
    print(my.dataframe$Name[order(as.character(my.dataframe$Club_Joining))][x])
}
