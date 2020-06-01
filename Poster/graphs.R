# Library
#library(tidyverse)
#library(ggplot2)
#library(dplyr)
#library(hrbrthemes)

#library(readxl)
#X_plot_data <- read_excel("mz_poster_files/plot_data.xlsx")
#View(X_plot_data)

#fix <- na.omit(X_plot_data)

  
#lolipop_guild <-
  
  fix %>% 
ggplot() +
  geom_point(aes(  x = holland_codes, 
                   y = interest_corr,
               color = "blue",
                size = 10,)) +
    geom_text(aes(x = holland_codes, color = "blue", fontface = "bold",
               y = interest_corr,
               label = interest_corr),
              nudge_x = 0.2) +
  geom_point(aes(  x = holland_codes, 
                   y = Int_se_corr,  
               color = "red",
                size = 10)) +
    geom_text(aes(x = holland_codes,  color = "red", fontface = "bold",
                  y = Int_se_corr,
                  label = Int_se_corr),
              nudge_x = 0.2) +
    geom_errorbar(aes(x = holland_codes, 
                   ymin = i_ci_min , 
                  ymax = i_ci_max, 
                   alpha = .5,
                   color = "blue"),
                size = 3) +
    geom_errorbar(aes(x = holland_codes, 
                   ymin = i_se_ci_min, 
                   ymax = i_se_ci_max, 
                   color = "red",
                   alpha = .5),
               size = 3) +
  coord_flip() +
  theme_minimal() +
  theme(legend.position = "none",
         panel.background = element_rect(fill = "transparent"), 
          plot.background = element_rect(fill = "transparent", color = NA), 
         panel.grid.major = element_blank(), 
         panel.grid.minor = element_blank(),
        legend.background = element_rect(fill = "transparent"), 
    legend.box.background = element_rect(fill = "transparent"),
    text = element_text(size = 15),
    plot.title = element_text(hjust = 2)
  ) +
  labs(title = "Convergent correlations between measures of interests with other 
       interest measures (red) and with self-efficacy measures (blue).") +
  xlab("") +
  ylab("Correlations with confidance Intervals")

ggsave(here::here("images", "lolipop_guild.jpg"))


