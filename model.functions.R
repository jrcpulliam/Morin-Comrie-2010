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
# Equation 12: Equation to relate temperature to survival percent. 
eqn_12 <- function(t,
                   a=-0.0057,
                   b=0.2826,
                   c=-2.5551,
                   d=0.1554){
	if (t>12 & t<37)	{
		y<- a*t^2 + b*t + c
	}else{
		y<- d
	}
	return(y)
}
#Equation 14: Gonotrophic cycle  
eqn_14 <- function(t,
                   d=17.75,
                   f=-0.0613,
                   g=0,
                   h=1/2.5) {
	if (t<32 & t>=13) {
		y <- 1/(d*exp(f*t))
	}else{ 
	if (t<13) {
		y <- g
	}else{ if (t>=32) {
		y <- h
	}
	return(y)
	}}}  
