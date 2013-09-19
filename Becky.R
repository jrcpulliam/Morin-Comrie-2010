# Becky's scratch file

## Starting to link equations 12-13
## Includes Luke's code for Eqn 12, a function not explicitly defined in the article, and Eqn 13.

#Equation 12: Equation to relate temperature to survival percent.
a1 = -0.0057
a2 = 0.2826
a3 = -2.5551
a4 = 0.1554

eqn_12 <- function(t,a=a1,b=a2,c=a3,d=a4){
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
#Possibly refer to Rueda et al. (1990) ?
#r(K)

parms.instar1<- c(RH025=1.23439,
									HA=27534.92,
									HH=37071.82,
									TH=301)

parms.instar2<- c(RH025=1.42950,
									HA=28219.93,
									HH=39340.77,
									TH=301.37)

parms.instar3<- c(RH025=0.94308,
									HA=20767.22,
									HH=36213.96,
									TH=304)

parms.instar4<- c(RH025=0.31230,
									HA=12629.46,
									HH=140281.42,
									TH=308.31)

parms.pupae<- c(RH025=0.55490,
									HA=15648.63,
									HH=43983.41,
									TH=306.60)

all.parms <- c(parms.instar1, parms.instar2, parms.instar3, parms.instar4, parms.pupae)

names(all.parms) <- c(paste("i1",names(parms.instar1),sep="."),
											paste("i2",names(parms.instar2),sep="."),
											paste("i3",names(parms.instar3),sep="."),
											paste("i4",names(parms.instar4),sep="."),
											paste("p",names(parms.pupae),sep="."))
all.parms

development <- function(t){
  y<- t       #insert function for Dt here 
  return(y)
}

###############
r <- function(K,parms){
	
	r.instar1<-(i1.RH025*K/298.15)*exp((i1.HA/1.987)
	
	y<- list(c(r.instar1,r.instar2,r.instar3,r.instar4,r.pupae)       #insert function for Dt here 
	return(y)
}
###############

#Equation 13: Equation for the daily survival rate for larvae and pupae.
#Requires Eqn 12 (survival percent) and Dt (combined development time of the larae and pupae at a given temperature)

eqn_13 <- function(t, Sl = eqn_12(t), Dt = development(t)){ 
  y<- 10^(log10(Sl/Dt))
  return(y)
}

#Test equation 13
x.vals <- seq(0,49,.5)
rate.vals <- sapply(x.vals,eqn_13)

plot(x.vals,rate.vals,type="p")


