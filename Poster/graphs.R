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


