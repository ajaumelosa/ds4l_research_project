# load libraries
source(
  here::here("scripts","libraries.R")
)

# load csv
raw_data <- read_csv(
  here(
    "data","raw","preference_data.csv"
    )
  )

# generate felicitous/infelicitous col
# generate 3/4 or 4/4 people in video VERBing col

gen_data <- raw_data %>%
  add_column(
    felicitous = rep(c("felicitous","infelicitous"), each = 10, times = 400
    )
  )

# tidy data
tidy_data <- gen_data %>%
  separate(
    col = id,
    into = c("id","lang"),
    sep = "_"
  ) %>%
  mutate(
    mono = ifelse(
      lang == "es", "mono", "L2"
    ),
    mono = as.factor(mono),
    condition = as.factor(condition),
    felicitous = as.factor(felicitous),
    preference = as.factor(preference)
  ) %>%
  select(
    -lang
  )

# save tidied data
tidy_data %>% write_csv(
  here(
    "data","tidy","tidy_preferences_data.csv"
  )
)
