#1
library(ggplot2)
for (sizeOfSample in 2:5){
  sample <- vector()
  means <- vector()
  numOfSample <- 0
  repeat {
    sample <- runif(sizeOfSample, min = 0, max = 1)
    means <- c(means, mean(sample))
    numOfSample <- numOfSample + 1
    if (numOfSample >= 1000){
      break;
    }
  }
  standardDeviation <- sd(means)
  expectedValue <- mean(means)
  means <- as.data.frame(means)
  inf <- paste("Expected, Value = ", expectedValue, "\nStandard Deviation = ", standardDeviation)
  print(ggplot(means, aes(x = means)) + geom_density() + ggtitle(inf))
}

#2
probabilities <- vector()
for (sizeOfSample in 2:31){
  failedSamples <- 0
  numOfSample <- 0
  repeat {
    numOfSample <- numOfSample + 1
    sample <- runif(sizeOfSample, min = 0, max = 1)
    #Expected Value of uniform in (0,1) = 0.5
    if (mean(sample) - 0.5 >= 0.005 || mean(sample) - 0.5 <= -0.005){
      failedSamples <- failedSamples + 1
    }
    if (numOfSample >= 1000){
      break;
    }
  }
  probabilities <- c(probabilities, as.double(failedSamples/1000))
}
table <- data.frame(c(2:31), probabilities)
