library(gridExtra)
library(ggplot2)
data <- read.csv("D:\\University\\Courses\\Probability & Statistics\\HW6\\general math total groups score.csv")

#1
data[data == "?"] <- 0
female <- data[data$Gender == "F",]
girlsGrades <- ((female$M1 + female$M2 + female$M3 + female$Final)/4)
male <- data[data$Gender == "M",]
boysGrades <- ((male$M1 + male$M2 + male$M3 + male$Final)/4)

test <- t.test(boysGrades, girlsGrades)

print(test$p.value)

#p is very small so it can be claimed that there is a significant difference between boys and girls.
#according to means of girls and boys, the second group have done better in general.

#2
teacher1 <- data[data$Teacher == "B",]
teacher2 <- data[data$Teacher == "M",]
teacher3 <- data[data$Teacher == "S",]
teacher1 <- ((teacher1$M1 + teacher1$M2 + teacher1$M3 + teacher1$Final)/4)
teacher2 <- ((teacher2$M1 + teacher2$M2 + teacher2$M3 + teacher2$Final)/4)
teacher3 <- ((teacher3$M1 + teacher3$M2 + teacher3$M3 + teacher3$Final)/4)

test1 <- t.test(teacher1, teacher2)
test2 <- t.test(teacher1, teacher3)
test3 <- t.test(teacher2, teacher3)

res <- c(test1$p.value, test2$p.value, test3$p.value)

#there is no significant difference between the 1st & the 2nd teacher
#there is no significant difference between the 2nd & the 3rd teacher
#there is significant difference between the 1st & the 3rd teacher
#any definite conclusion can not be made only based on this test.

#3


#4.a
data$Department <- as.factor(data$Department)

ggplot(data, aes( x = Department, y = Final)) + geom_boxplot()

#4.b
female <- data[data$Gender == "F",]
girlsGrades <- ((female$M1 + female$M2 + female$M3 + female$Final)/4)
male <- data[data$Gender == "M",]
boysGrades <- ((male$M1 + male$M2 + male$M3 + male$Final)/4)
par(mfrow=c(1,2))
hist(boysGrades, main = "")
hist(girlsGrades, main = "")


#4.c
dep <- as.factor(data$Department)

dep1 <- data[data$Department == 20,]
dep2 <- data[data$Department == 21,]
dep3 <- data[data$Department == 22,]
dep4 <- data[data$Department == 24,]
dep5 <- data[data$Department == 25,]
dep6 <- data[data$Department == 26,]
dep7 <- data[data$Department == 27,]
dep8 <- data[data$Department == 28,]
dep9 <- data[data$Department == 40,]
dep10 <- data[data$Department == 45,]
dep11 <- data[data$Department == 49,]

dep1 <- ((dep1$M1 + dep1$M2 + dep1$M3 + dep1$Final) /4)
dep2 <-  ((dep2$M1 + dep2$M2 + dep2$M3 + dep2$Final) /4)
dep3 <-  ((dep3$M1 + dep3$M2 + dep3$M3 + dep3$Final) /4)
dep4 <- ((dep4$M1 + dep4$M2 + dep4$M3 + dep4$Final) /4)
dep5 <-  ((dep5 $M1 + dep5 $M2 + dep5 $M3 + dep5 $Final) /4)
dep6 <-  ((dep6$M1 + dep6$M2 + dep6$M3 + dep6$Final) /4)
dep7 <-  ((dep7$M1 + dep7$M2 + dep7$M3 + dep7$Final) /4)
dep8 <-  ((dep8$M1 + dep8$M2 + dep8$M3 + dep8$Final) /4)
dep9 <-  ((dep9$M1 + dep9$M2 + dep9$M3 + dep9$Final) /4)
dep10 <-  ((dep10$M1 + dep10$M2 + dep10$M3 + dep10$Final) /4)
dep11 <-  ((dep11$M1 + dep11$M2 + dep11$M3 + dep11$Final) /4)

dep1 <- data.frame(dep1)
dep2 <- data.frame(dep2)
dep3 <- data.frame(dep3)
dep4 <- data.frame(dep4)
dep5 <- data.frame(dep5)
dep6 <- data.frame(dep6)
dep7 <- data.frame(dep7)
dep8 <- data.frame(dep8)
dep9 <- data.frame(dep9)
dep10 <- data.frame(dep10)
dep11 <- data.frame(dep11)
plot1 <- ggplot() + geom_density(data = dep1, aes(x=dep1))
plot2 <-  ggplot() + geom_density(data = dep2, aes(x=dep2))
plot3 <-  ggplot() + geom_density(data = dep3, aes(x=dep3))
plot4 <-  ggplot() + geom_density(data = dep4, aes(x=dep4))
plot5 <-  ggplot() + geom_density(data = dep5, aes(x=dep5))
plot6 <-  ggplot() + geom_density(data = dep6, aes(x=dep6))
plot7 <-  ggplot() + geom_density(data = dep7, aes(x=dep7))
plot8 <-  ggplot() + geom_density(data = dep8, aes(x=dep8))
plot9 <-  ggplot() + geom_density(data = dep9, aes(x=dep9))
plot10 <-  ggplot() + geom_density(data = dep10, aes(x=dep10))
plot11 <-  ggplot() + geom_density(data = dep11, aes(x=dep11))

ggplot() + geom_density(data = dep1, aes(x=dep1),colour = "red") + geom_density(data = dep2, aes(x=dep2), colour = "blue") + geom_density(data = dep3, aes(x=dep3), colour = "green") + geom_density(data = dep4, aes(x=dep4), colour="pink") + geom_density(data = dep5, aes(x=dep5), colour= "yellow") + geom_density(data = dep6, aes(x=dep6), colour = "orange")+geom_density(data = dep7, aes(x=dep7), colour = "brown")+geom_density(data = dep8, aes(x=dep8),colour = "deepskyblue") + geom_density(data = dep9, aes(x=dep9), colour = "bisque") + geom_density(data = dep10, aes(x=dep10),colour = "violet") + geom_density(data = dep11, aes(x=dep11)) 