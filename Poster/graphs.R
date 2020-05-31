# Library
library(ggplot2)
library(dplyr)
library(hrbrthemes)

library(readxl)
X_plot_data <- read_excel("mz_poster_files/plot_data.xlsx")
View(X_plot_data)


  
lolipop_guild <- X_plot_data %>% 
ggplot() +
  geom_point(  aes(x = holland_codes, y = interest_corr, color = "blue")) +
  geom_point(  aes(x = holland_codes, y = Int_se_corr,  color = "red")) +
  geom_segment(aes(x = holland_codes, xend = holland_codes, y = i_ci_min , yend = i_ci_max, color = "blue")) +
  geom_segment(aes(x = holland_codes, xend = holland_codes, y = i_se_ci_min , yend = i_se_ci_max, color = "red")) +
  coord_flip() +
  theme_minimal() +
  theme(
    legend.position = "none",
  ) +
  labs(title = "Convergent corralations between measures of interests and self-efficacy") +
  xlab("") +
  ylab("Corralations and Confidance Intervals")

ggsave(here::here("images", "lolipop_guild.jpg"))









# Create data
#value1 <- abs(rnorm(26))*2
#data <- data.frame(
#  x=LETTERS[1:26], 
#  value1=value1, 
#  value2=value1+1+rnorm(26, sd=1) 
#)

# Reorder data using average? Learn more about reordering in chart #267
#data <- data %>% 
#  rowwise() %>% 
#  mutate( mymean = mean(c(value1,value2) )) %>% 
#  arrange(mymean) %>% 
 # mutate(x=factor(x, x))

# Plot
#ggplot(data) +
 # geom_segment( aes(x=x, xend=x, y=value1, yend=value2), color="grey") +
  #geom_point( aes(x=x, y=value1), color=rgb(0.2,0.7,0.1,0.5), size=3 ) +
  #geom_point( aes(x=x, y=value2), color=rgb(0.7,0.2,0.1,0.5), size=3 ) +
#  coord_flip()+
 # theme(
 #   legend.position = "none",
 # ) +
 # xlab("") +
 # ylab("Value of Y")

