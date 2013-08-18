#Equations 12 & 14
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
#Test equation 12
x.vals <- seq(0,49,.5)
temp.vals <- sapply(x.vals,s_percent)

plot(x.vals,temp.vals,type="p",ylim=c(0,1))
abline(h=c(0,1),col="grey")
abline(v=c(12,37))
abline(h=.1554)

#Equation 14: Gonotrophic cycle 
b1 = 17.75
b2 = -0.0613
b3 = 0
b4 = 1/2.5

g_cycle <- function(t,d=b1,f=b2,g=b3,h=b4) {
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
#Test equation 14
x.vals <- seq(0,49,.5)
gono.vals <- sapply(x.vals,g_cycle)		 

plot(x.vals,gono.vals)
abline(v=c(13,32))
