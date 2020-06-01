# Library
library(tidyverse)
#library(ggplot2)
#library(dplyr)
library(hrbrthemes)

library(readxl)
X_plot_data <- read_excel("mz_poster_files/plot_data.xlsx") %>% 
  slice(1:6) %>% 
  rename(i_corr = interest_corr,
         i_min = i_ci_min,
         i_max = i_ci_max,
         se_corr = Int_se_corr,
         se_min = i_se_ci_min,
         se_max = i_se_ci_max) %>% 
  pivot_longer(cols = -holland_codes,
               names_to = c("type", ".value"),
               names_sep = "_") %>% 
  mutate(holland_codes = as_factor(holland_codes),
         type = as_factor(type)) 
#View(X_plot_data)

#fix <- na.omit(X_plot_data)

  
#lolipop_guild <-
  
X_plot_data %>% 
ggplot(
  aes(
    x = holland_codes,
    y = corr,
    color = holland_codes,
    shape = type)
) +
  geom_point(
    size = 10,
    position = position_dodge(width = .7)) +
  geom_errorbar(aes(ymin = min,
                    ymax = max),
                position = position_dodge(width = .7),
                width = 0) +
  scale_shape_manual(labels = c("I", "E"),
                     values = c("I", "E")) + 
  coord_flip() +
  scale_y_continuous(limits = c(.5, 1)) + 
  scale_x_discrete(
    limits = rev(levels(X_plot_data$holland_codes))
    ) +
  psychmeta:::theme_apa_nolegend

    
    geom_errorbar(aes(x = holland_codes, 
                   ymin = i_se_ci_min, 
                   ymax = i_se_ci_max, 
                   color = "red",
                   alpha = .5),
               size = 3) +
  coord_flip() +
  labs(title = "Convergent correlations between measures of interests with other 
       interest measures (red) and with self-efficacy measures (blue).") +
  xlab("") +
  ylab("Correlations with confidance Intervals") +
  theme_minimal() 


+
  theme(legend.position = "none",
         panel.background = element_rect(fill = "transparent"), 
          plot.background = element_rect(fill = "transparent", color = NA), 
         panel.grid.major = element_blank(), 
         panel.grid.minor = element_blank(),
        legend.background = element_rect(fill = "transparent"), 
    legend.box.background = element_rect(fill = "transparent"),
    text = element_text(size = 15),
    plot.title = element_text(hjust = 2)
  ) 

ggsave(here::here("images", "lolipop_guild.jpg"))


