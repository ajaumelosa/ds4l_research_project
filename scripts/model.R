# load libraries
source(
  here::here("scripts","libraries.R")
)

# load csv
tidy_data <- read_csv(
  here(
    "data","tidy","tidy_preferences_data.csv"
  )
)

# build models
mod0 <- glmer(
  formula = preference ~ 1 + mono +
    (1 | id),
  family = binomial(link = "logit"),
  data = tidy_data
)

mod1 <- glmer(
  formula = preference ~ 1 + mono + condition +
    (1 | id),
  family = binomial(link = "logit"),
  data = tidy_data
)

mod2 <- glmer(
  formula = preference ~ 1 + mono + word +
    (1 | id),
  family = binomial(link = "logit"),
  data = tidy_data
)

mod3 <- glmer(
  formula = preference ~ 1 + mono + word + condition +
    (1 | id),
  family = binomial(link = "logit"),
  data = tidy_data
)

mod4 <- glmer(
  formula = preference ~ 1 + mono*word +
  (1 | id),
  family = binomial(link = "logit"),
  data = tidy_data
)