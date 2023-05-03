# load libraries
source(
  here::here("scripts","libraries.R")
)

# load data
tidy_data <- read_csv(
  here(
    "data","tidy","tidy_preferences_data.csv"
  )
)

# plots
plot1 <- tidy_data %>%
  ggplot() +
  aes(x = mono, fill = as.factor(preference)) +
  geom_bar(position = "fill") +
  facet_wrap(word ~ condition) +
  labs(title="Acceptability Judgement Task",x="mono or L2", y = "acceptance", fill = "accept statement?", caption="Figure 1: % acceptance of acceptability judgement task")

plot1
