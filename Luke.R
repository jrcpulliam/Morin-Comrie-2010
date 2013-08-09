#Equations 12 & 14
#Equation 12: Equation to relate temperature to survival percent.
aa <- -0.0057
bb <- 0.2826
cc <- -2.5551

s_percent <- function(t,a=aa,b=bb,c=cc){
  if (t>12 & t<37)	{
		y<- a*t^2 + b*t + c
	}else{
		y<- 0.1554
	}
	return(y)
}
#Test equation 12
x.vals <- seq(0,49,.5)
temp.vals <- sapply(x.vals,s_percent)

plot(x.vals,temp.vals,type="p",ylim=c(0,1))
abline(h=c(0,1),col="grey")
abline(v=c(12,37))
abline(h=.1554)

#Equation 14: Gonotrophic cycle 
dd = 17.75
ff = -0.0613

g_cycle <- function(t,d=dd,f=ff) {
	if (t<32 & t>=13) {
		y <- 1/(d*exp(ff*t))
	}else{ 
	if (t<13) {
		y <- 0
	}else{ if (t>=32) {
		y <- 1/2.5
	}
	return(y)
	}}} 
#Test equation 14
x.vals <- seq(0,49,.5)
gono.vals <- sapply(x.vals,g_cycle)		 

plot(x.vals,gono.vals)
abline(v=c(13,32))