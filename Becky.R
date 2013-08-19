# Becky's scratch file

## Starting to link equations 12-13
## Includes Luke's code for Eqn 12, a function not explicitly defined in the article, and Eqn 13.

#Equation 12: Equation to relate temperature to survival percent.
a1 = -0.0057
a2 = 0.2826
a3 = -2.5551
a4 = 0.1554

s_percent <- function(t,a=a1,b=a2,c=a3,d=a4){
  if (t>12 & t<37)	{
    y<- a*t^2 + b*t + c
  }else{
    y<- d
  }
  return(y)
}

#Equation "development": the combined development time of the larvae and pupae at a given temperature.
#Explicit equation not included in the article, but is used in Eqn 13.  
#NEEDS TO BE REDEFINED (unless we don't actually need a function here).

development <- function(t){
  y<- t       #insert function for Dt here 
  return(y)
}

#Equation 13: Equation for the daily survival rate for larvae and pupae.
#Requires Eqn 12 (survival percent) and Dt (combined development time of the larae and pupae at a given temperature)

s_rate <- function(t, Sl = s_percent(t), Dt = development(t)){ #need to add Dt
  y<- 10^(log10(Sl/Dt))
  return(y)
}


