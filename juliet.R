# Juliet's scratch file

# Equation 2 (component of Schoolfield's model)
eqn_2 <- function(date,
									k1 = 0.2163108,
									k2 = 0.9671396,
									k3 = 0.00860,
									k4=186){
	if(class(date)%in%c("Date","POSIXct","POSIXlt")){
		date <- as.Date(date)
		JJ <- julian(date)
	}else{
		stop("First argument should be given in Date format.")
	}
	theta <- k1 + 2 * atan(k2*tan(k3*(JJ-k4)))
	return(as.numeric(theta))
}

# Test eqn_2
curve(eqn_2(x),from=0,to=365) # fails
curve(eqn_2(x),from=as.Date("2005-01-01"),to=as.Date("2006-12-31")) # seems to work

# Equation 3 (component of Schoolfield's model)
eqn_3 <- function(date,theta = eqn_2(date),k1 = 0.39795){
	phi <- asin(k1*cos(theta))
	return(phi)
}

# Test eqn_3
curve(eqn_3(x),from=0,to=365) # fails
curve(eqn_3(x),from=as.Date("2005-01-01"),to=as.Date("2006-12-31")) # seems to work

# Equation 4 (component of Schoolfield's model): average number of daylight hours per day
eqn_4 <- function(date,latitude,phi = eqn_3(date),pp=1){
  num <- sin(pp*pi/180) + sin(latitude*pi/180)*sin(phi)
  denom <- cos(latitude*pi/180)*cos(phi)
	H_t <- 24-24/pi * acos(num/denom)
  return(H_t)
}

gnv.lat <- 29.651997

# Test eqn_4
curve(eqn_4(x,latitude=gnv.lat),from=0,to=365) # fails
curve(eqn_4(x,latitude=gnv.lat),from=as.Date("2005-01-01"),to=as.Date("2006-12-31")) # seems to work

temp <- outer(seq(as.Date("2005-01-01"),as.Date("2006-12-31"),1),seq(-90,90,1),eqn_4)
image(temp,xlab="date",ylab="latitude")
abline(h=.5) # equator

# Today (2013-08-08): sunrise @ 06:53, sunset @ 20:16 -> 13.38 hrs between sunrise and sunset
eqn_4(as.Date("2013-08-08"),gnv.lat) # 13.52 - prediction using default p=1
eqn_4(as.Date("2013-08-08"),gnv.lat,pp=.18) # 13.382 

# Hamon's equation (Hamon 1961)
eqn_1 <- function(T_mean,e_s,date,latitude,H_t = eqn_4(date,latitude),k1 = 2.1,k2=273.2){
	num <- k1 * H_t^2 * e_s
	denom <- T_mean + k2
	ET_0 <- num/denom
	return(ET_0)
}
