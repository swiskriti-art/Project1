library(tidycensus)
library(httr)
library(dplyr)
library(tidyr)
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


# build sample call with httr method
URL_id <- "https://api.census.gov/data/2022/acs/acs1/pums?get=SEX,PWGTP,MAR&for=public%20use%20microdata%20area:*&in=state:01&SCHL=24"

census_data <- httr::GET(URL_id)
census_tib <- as_tibble(parsed)
str(census_tib)