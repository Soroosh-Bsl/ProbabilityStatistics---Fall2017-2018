#functions declaration
linear <- function(modulus, a, b, x_0, size){
      x <- vector("integer")
      indexCounter <- 0
      while (indexCounter < size){
              if (indexCounter == 0){
                  x[indexCounter+1] = (a*x_0+b) %% modulus
              }
              else{
                  x[indexCounter+1] = (a*x[indexCounter]+b) %% modulus   
              }
              indexCounter = indexCounter+1
          }
      print(x)
      return(x)
}

cycleDetector <- function(x){
     turtoise <- 2
     hare <- 3
     while (x[turtoise] != x[hare]){
         turtoise = turtoise + 1
         hare = hare + 2
     }
     turtoise <- 1
     while(x[turtoise] != x[hare]){
         turtoise = turtoise + 1
         hare = hare + 1
     }
     while(x[turtoise] != x[hare]){
         turtoise = turtoise + 1
         hare = hare + 1
         mu < mu + 1
     }
     mu <- 0
     turtoise <- 2
     hare <- 3
     while (x[turtoise] != x[hare]){
         turtoise = turtoise + 1
         hare = hare + 2
     }
     turtoise <- 1
     indexOfCycleStart <- 1
     while(x[turtoise] != x[hare]){
         turtoise = turtoise + 1
         hare = hare + 1
         indexOfCycleStart <- indexOfCycleStart + 1
     }
     
     cycleLength <- 1
     hare <- turtoise + 1
     while (x[turtoise] != x[hare]){
         hare = hare + 1
         cycleLength = cycleLength + 1
     }
     print(cycleLength)
     return(cycleLength)
}


midsquare <- function(x_0, size){
    indexCounter <- 0
    numOfDigits <- floor(log10(x_0)) + 1
    x <- vector("integer")
    temp <- 0
    while (indexCounter < size){
        if (indexCounter == 0){
            temp <- as.integer((x_0 * x_0)/(10^(ceiling(numOfDigits/2))))
            temp <- temp %% (10^(numOfDigits))
            x[indexCounter+1] <- temp
        }
        else{
          temp <- as.integer((x[indexCounter] * x[indexCounter])/(10^(ceiling(numOfDigits/2))))
          temp <- temp %% (10^(numOfDigits))
          x[indexCounter+1] <- temp
        }
        indexCounter <- indexCounter + 1
    }
    print(x)
    return(x)
}

#a(i)
modulus <- as.integer(readline(prompt = "Enter m (modulus) :"))
a <- as.integer(readline(prompt = "Enter a :"))
b <- as.integer(readline(prompt = "Enter b :"))
x_0 <- as.integer(readline(prompt = "Enter x_0 (seed) :"))
size <- 100
x <- linear(modulus, a, b, x_0, size)
#a(ii)
cycleDetector(x)
#a(iii)
modulus <- 1000
a <- 80
b <- 200
x_0 <- 80
x <- linear(modulus, a, b, x_0, 1000)
cycleDetector(x)
#a(iv): No. It's not really a random one because it has a cycle whcih repeats that.

#b(i)
x_0 <- as.integer(readline(prompt = "Enter x_0 (seed) :"))
size <- 100
x <- midsquare(x_0, size)
#b(ii)
cycleDetector(x)
#b(iii)
x_0 <- 100
size <- 1000
x <- midsquare(x_0, size)
cycleDetector(x)
#b(iv): No. It's not really a random one because it has a cycle whcih repeats that.

#c(i) 
x_0 <- as.integer(readline(prompt = "Enter x_0 (seed) :"))
set.seed(x_0)
x <- sample(1:100, 100)
print(x)
#c(ii)
cycleDetector(x)
#c(iii)
set.seed(100)
x <- sample(1000)
print(x)
cycleDetector(x)
#c(iv):  it has no cycles so it gives different numbers with no cycle but it produces always the same using the same seed so it's just psedu random.

