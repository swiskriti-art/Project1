library(tidycensus)
library(httr)
library(dplyr)
library(tidyr)
library(tidyverse)
library(jsonlite)


# attempting call from lecture
households <- "DP02_0001E"

household_division <- get_acs(variables = households, 
                     geography = "division",
                     geometry = TRUE,
                     survey = "acs5",
                     show_call = TRUE,
                     key = "e267f117801b2ef741e54620602b0903c5f4d3c8"
) 


# call sample call with httr method and manipulate
#year22
data_yr22 <- "https://api.census.gov/data/2022/acs/acs1/pums?get=SEX,PWGTP,MAR&for=public%20use%20microdata%20area:*&in=state:01&SCHL=24"

census_data_yr22 <- httr::GET(data_yr22)
census_parse_yr22 <- fromJSON(rawToChar(census_data_yr22$content))

str(census_parse_yr22)
census_parse_yr22[1,1:6]

#year21 - just changing year in URL
data_yr21 <- "https://api.census.gov/data/2021/acs/acs1/pums?get=SEX,PWGTP,MAR&for=public%20use%20microdata%20area:*&in=state:01&SCHL=24"

census_data_yr21 <- httr::GET(data_yr21)
census_parse_yr21 <- fromJSON(rawToChar(census_data_yr21$content))

str(census_parse_yr21)
census_parse_yr21[1,1:6]

