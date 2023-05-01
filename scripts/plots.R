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
  aes(x = mono, fill = preference) +
  geom_bar(position = "fill") +
  facet_wrap(word ~ condition) +
  labs(x="mono or L2", y = "acceptance")

plot1
