# DyMSiM.R

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

# Equation 3 (component of Schoolfield's model)
eqn_3 <- function(date,theta = eqn_2(date),k1 = 0.39795){
	phi <- asin(k1*cos(theta))
	return(phi)
}

gnv.lat <- 29.68333

# Equation 4 (component of Schoolfield's model): average number of daylight hours per day
eqn_4 <- function(date,latitude=gnv.lat,phi = eqn_3(date),pp=1){
	num <- sin(pp*pi/180) + sin(latitude*pi/180)*sin(phi)
	denom <- cos(latitude*pi/180)*cos(phi)
	H_t <- 24-24/pi * acos(num/denom)
	return(H_t)
}

# Hamon's equation (Hamon 1961)
eqn_1 <- function(T_mean,e_s,date,latitude=gnv.lat,H_t = eqn_4(date,latitude),k1 = 2.1,k2=273.2){
	num <- k1 * H_t^2 * e_s
	denom <- T_mean + k2
	ET_0 <- num/denom
	return(ET_0)
}

curve(eqn_4(x,latitude=gnv.lat),from=min(date),to=max(date),bty="L",main="Gainesville",
			ylab="Daylight Hours (Equation 4)",xlab="Date") # seems to work

plot(date,eqn_1(temp,e_s=1,date),bty="L",main="Gainesville",
			ylab="Evapotranspiration",xlab="Date",cex=.8)
warning("Value for e_s not determined. Using e_s = 1.")

source("Ajit_Morin and Comrie.R")