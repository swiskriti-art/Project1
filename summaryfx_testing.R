library(tidyverse)

#create made up tibble mix of 'char' 'dbl' and 'int'variables

yr <- seq(2011,2020,by=1)
letter <- letters[1:10]
num1 <- seq(1:10)
num2 <- num1*pi

df <- data.frame(yr,letter,num1,num2)
df <- df |> mutate(num3 = num2*runif(1,0,40),
                  key = c("AAA", "AAA", "AAB",
                          "BAA", "BAB", "ABA",
                          "ABC", "ABC", "ABC",
                          "CCC")
                  )

tib <- as_tibble(df)

class(tib) <- c("census", class(tib))

# function to produce mean and sd for numeric vars & counts for categorial
# take three arguments: class, num variables, and categorial variables

summaryfx <- function(tib, numvars = c("num1","num2","num3")){
  #check tibble class contains "census"
  if(!("census" %in% class(tib))){
    stop("Tibble is not in a Census Class")
  }
  
  #numvars <- stringr::str_replace_all(numvars,"num","")

  for (clmn in numvars){
    means = sapply(tib[,numvars],mean)
    stddev = sapply(tib[,numvars],sd)
  }
 #prepare result list
  names(means) <- paste0(names(means)," mean")
  print(means)
  
  names(stddev) <- paste0(names(stddev)," StdDev")
  print(stddev)
}

summaryfx(tib)

summaryfx(tib, numvars = "num3")



