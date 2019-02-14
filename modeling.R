library(tidyverse)

library(haven)


cps <- read_dta("data-raw/cps_mar_2000_new with additional vars.dta")

print_labels(cps$sex)

# clean my data
cps_new <-
    cps %>%
    sample_frac(0.01) %>%
    select(incwage, age, sex, yrsed) %>%
    mutate(
        sex = case_when(sex == 1 ~ "male", sex == 2 ~ "female"),
        college = case_when(yrsed >= 13 ~ "college", yrsed <= 12 ~ "no_college")
    ) %>%
    filter(age >= 16)

# plotting
cps_new %>%
    ggplot(aes(x = age, y = incwage)) +
    geom_point(alpha = 0.25) +
    facet_grid(sex ~ college) +
    geom_smooth(method = "lm")

# modeling
mod <- lm(incwage ~ age + college + sex, data = cps_new)

summary(mod)

library(broom)

tidy(mod) %>%
    filter(p.value <= 0.05)





