#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from https://usa.ipums.org/usa/index.shtml
# Author: Yuchen Cong, Jingwen Deng, Ruoxi Guan, Yuwei Sun
# Date: 2 November 2020
# Contact: jingwen.deng@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(haven)
library(tidyverse)
# Read in the raw data.
raw_census <- read_dta("/Users/macbookair/Desktop/STA304/PS3/usa_00001.dta")
colnames(raw_census)
# Add the labels
raw_census <- labelled::to_factor(raw_census)

# Just keep some variables that may be of interest (change 
# this depending on your interests)
reduced_census <- 
  raw_census %>% 
  select(perwt,
         citizen,
         age, 
         sex,
         race,
         educd,
         statefip,
         labforce,
         )

reduced_data <- 
  reduced_data %>%
  count(age) %>%
  group_by(age) 

reduced_data <- 
  reduced_data %>% 
  filter(age != "less than 1 year old") %>%
  filter(age != "90 (90+ in 1980 and 1990)")

reduced_data$age <- as.integer(reduced_data$age)

# Saving the census data as a csv file in my
# working directory
write_csv(reduced_census, "/Users/macbookair/Desktop/STA304/PS3/census_data.csv")

         