library(ggplot2)

#1
days <- rexp(1000, 0.1)
days <- as.data.frame(days)
ggplot(days, aes(x = days)) + geom_density()

#2
days<- vector("numeric")
numberInEachYear <- vector("numeric")
numInYear <- function(years){
  days<- vector("numeric")
  numberInEachYear <- vector("numeric")
  counter <- 0
  while (years >= 1){
    days <- c(days, rexp(1, 0.1))
    counter <- counter + 1
    if (sum(days) >= 365){
      years <- years -1 
      days <- vector("numeric")
      numberInEachYear <- c(numberInEachYear, counter)
      counter <- 0
    }
  }
  return (numberInEachYear)
}

#3
numberInEachYear <- numInYear(10)
numberInEachYear <- as.data.frame(numberInEachYear)
ggplot(numberInEachYear, aes(x = numberInEachYear)) + geom_density()

numberInEachYear <- numInYear(100)
numberInEachYear <- as.data.frame(numberInEachYear)
ggplot(numberInEachYear, aes(x = numberInEachYear)) + geom_density()

numberInEachYear <- numInYear(1000)
numberInEachYear <- as.data.frame(numberInEachYear)
ggplot(numberInEachYear, aes(x = numberInEachYear)) + geom_density()

#4
tenth_time <- vector("numeric")
time <- vector("numeric")
tenth <- function(n){
  repeat {
    
    if (n == 0){
      break
    }
    n <- n-1
    days <- c(rexp(10, 0.1))
    time <- c(time, sum(days))
  }
  return(time)
}

#5
tenth_time <- tenth(1000)
tenth_time <- as.data.frame(tenth_time)
ggplot(tenth_time, aes(x = tenth_time)) + geom_density()

