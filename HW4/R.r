data <- read.csv(file = "D:\\University\\Courses\\Probability & Statistics\\HW4\\movie_metadata.csv")
data[is.na(data)] <- 0
covariances <- vector()
facts <- c("budget", "color", "num_critic_for_reviews", "duration", "director_facebook_likes", "actor_1_facebook_likes", "num_voted_users", "cast_total_facebook_likes", "num_user_for_reviews", "imdb_score", "movie_facebook_likes")
for (i in facts){
  for (j in facts){
      temp <- data[[i]]
      temp2 <- data[[j]]
      temp <- as.numeric(temp)
      temp2 <- as.numeric(temp2)

      covariances <- c(covariances, cov(temp, temp2))
      
    }
}
results <- matrix(covariances, nrow = 11, ncol = 11)

names(results) <- facts
colnames(results) <- facts
rownames(results) <- facts
new <- cov2cor(results)

results <- as.data.frame(results)
write.csv(file = "D:\\University\\Courses\\Probability & Statistics\\HW4\\cov_mat.csv", results)


new <- cov2cor(results)
#according to correlation matrix wich is saved into new we can see that:
#num_voted_users
#num_critic_for_reviews
#num_user_for_reviews
#movie_facebook_likes
#duration
#cast_total_facebook_likes
#actor_facebook_likes
#budget
#color (black & white)
# so increasing duration or making colorful or use cast and actor who are most popular can effect a movies success.

for (i in facts){
  for (j in facts){
    if (j != i){
    temp <- data[[i]]
    temp2 <- data[[j]]
    temp <- as.numeric(temp)
    temp2 <- as.numeric(temp2)
    plot(temp, temp2, xlab = i, ylab = j)
    abline(lm(temp2~temp))
    }
    
  }
}
