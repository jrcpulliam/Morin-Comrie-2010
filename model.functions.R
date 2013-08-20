# Model functions file

# development values at a specific temperature, T
# eqn 7 in Morin 2010 paper

Vt <- function(Lt) 
{
  y <- 1/Lt
  return(y)
}

# parameter meaning
# Lt = length of time in days

# eggs laid by a female at a given temperature T
# derived from El Rayah and Groun in..
# Morin 2010 paper
# this is eqn 8

Et<- function(par9,temp,par10)
{
  y <- -par9*temp+par10
  return(y)
}

# parameter meaning
# par9 = constant from El Rayah and Abu Groun
# temp = temp in C
# par10 = constant from El Rayah and Abu Groun
