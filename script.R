# how I generated the example data + some experiments
library(nycflights13) # dataset
library(dplyr)
library(readr)

set.seed(1000)
some_flights <- flights |> sample_n(2000)
some_flights |>
  # mutate(empty_column = sample(c("", "a", "x", ""), n(), replace=T)) |> 
  write_csv("Flight Subset 2013.csv")
file.copy("Flight Subset 2013.csv", "data/nycflights13_random2000.csv")
nrow(na.omit(some_flights)) # 1948


read_csv("flight subset 2013.csv") |> 
  na.omit() |> nrow() # 970

read.csv("flight subset 2013.csv") |> 
  na.omit() |> nrow() # 1948

some_flights |> 
  filter(!is.na(air_time)) |> nrow() # 1948


some_flights |> 
  select(year, month, day, time_hour) |> 
  mutate(month_name = month.name[month])


some_flights |> 
  mutate(across(
    ends_with("delay"),
    ~ case_when(
      is.na(.x) ~ NA_character_,
      .x < -30 ~ "Early",
      .x < 30 ~ "Kind of on time",
      .x < 120 ~ "Late",
      TRUE ~ "Way too late"
      ),
    .names = "{.col}_cat")) |> 
  select(starts_with("dep"), starts_with("arr"), starts_with("sched")) |> 
  count(dep_delay_cat)

some_flights |> mutate(across(where(is.character), as.factor))

for (i in seq_along(some_flights$dep_delay)) {
  print(some_flights$dep_delay[[i]])
}

some_flights
some_flights2 <- some_flights
for (i in 1:length(some_flights2$dep_delay)) {
  if(is.na(some_flights2$dep_delay[[i]])){
    some_flights2[i, "dep_delay_cat"] <- NA
  }else if(some_flights2$dep_delay[[i]] < -30){
    some_flights2[i, "dep_delay_cat"] <- "Early"
  }else if(some_flights2$dep_delay[[i]] < 30){
    some_flights2[i, "dep_delay_cat"] <- "Kind of on time"
  }else if (some_flights2$dep_delay[[i]] < 120) {
    some_flights2[i, "dep_delay_cat"] <- "Late"
  } else {
    some_flights2[i, "dep_delay_cat"] <- "Way too late"
  }
}
table(some_flights2$dep_delay_cat)
count(some_flights2, dep_delay_cat)
