library(moments)
all_generated_data <- list()
set.seed(23)
for (i in 1:300) {
  generated_data <- rlnorm(n = 10, meanlog = 0, sdlog = 10)
  all_generated_data[[i]] <- generated_data
}
srednie <- sapply(all_generated_data, mean)
srednia_srednich<-mean(srednie)
odchylenie_srednich<-sd(srednie)
skosnosc_srednich<-skewness(srednie)
kurtoza_srednich<-kurtosis(srednie)

mean_ln <- exp(0+ (0.5 * 10^2)) 

all_generated_data[[4]]
mean(all_generated_data[[10]])
