#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from https://www.voterstudygroup.org/publication/nationscape-data-set
# Author: Yuchen Cong, Jingwen Deng, Ruoxi Guan, Yuwei Sun
# Date: 2 November 2020
# Contact: jingwen.deng@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(haven)
library(tidyverse)
library(dplyr)
# Read in the raw data (You might need to change this if you use a different dataset)
raw_survey <- read_dta("/Users/macbookair/Desktop/STA304/PS3/Nationscape-DataRelease_WeeklyMaterials_DTA/phase_2_v20200814/ns20200625/ns20200625.dta")
# Add the labels
raw_survey <- labelled::to_factor(raw_survey)
# Just keep some variables
reduced_survey <- 
  raw_survey %>% 
  select(interest,
         registration,
         vote_2016,
         vote_intention,
         vote_2020,
         ideo5,
         employment,
         foreign_born,
         gender,
         census_region,
         hispanic,
         race_ethnicity,
         household_income,
         education,
         state,
         congress_district,
         age)
unique(reduced_survey$household_income)

reduced_survey<-
  reduced_survey %>%
  mutate(vote_trump = 
           ifelse(vote_2020 =="Donald Trump", 1, 0))

# Saving the survey/sample data as a csv file in my
# working directory
write_csv(reduced_survey, "/Users/macbookair/Desktop/STA304/PS3/survey_data.csv")

