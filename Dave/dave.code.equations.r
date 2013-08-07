# "homework" for Pulliam lab

# model of environmental conditions

# Hamon's equation (Hamon, 1961) to calculate daily evaporation (ETo)
# equation 1 in Morin paper (2010)

ETo <- function(par1,Ht,es,tmean,par2)
	{
	ETo<-(par1*(Ht^2)*es)/(tmean+par2)
	return(ETo)
}
# parameter meaning
# par1 = constant from literature
# Ht = average # daylight hours
# es = saturation vapor pressure
# tmean = daily mean temp in C

# theta is revolutionary angle of the sun!
# eqn 2 in Morin 2010 paper

theta<- function(par3,par4,par5,J,par6)
{
	theta <- par3+2*atan(par4*tan(par5*(J-par6)))
	return(theta)
}
# parameter meaning
# par3-par6 = constants in the equation
# J = Julian day of the year

# phi, angle of the sun!
# eqn 3 in Morin 2010 paper

phi<- function(par7, theta)
{
	phi <- asin(par7*cos(theta))
	return(phi)
}
# parameter meaning
# par7 = constant in equation
# theta = revolutionary angle of the sun, calculated in another bit of code

# average # daylight hours from Schoolfield's model (Forsyther et al, 1995)
# eqn 4 in Morin 2010 paper

Ht<- function(par8, p, L, phi)
{
	Ht <- par8-par8/pi*acos((sin*(p*pi/180)+sin(L*pi/180)*sin(phi))/(cos(L*pi/180)*cos(phi)))
	return(Ht)
}

# parameter meaning
# par8 = constant in the model, NB this is hour per day, so global!
# L = latitude
# p = day length coefficient in degrees, default is p=1
# phi = angle of declination of the sun in radians

# total water in the system (Wt)
# eqn 5 in Morin 2010 paper

Wt<- function(Wp,Wn,Wi)
{
	Wt <- Wp+Wn+Wi
	return(Wt)
}

# parameter meaning
# Wp = permenant water
# Wn = amount of water on non-permeable surfaces
# Wi = amount of water on permeable surfaces

# carrying capacity CC of the system
# eqn 6 in Morin 2010 paper

CC <- function(Ecoef,density,Wt) # NB CC to avoid use of C
{
	CC <- Ecoef*Density*Wt
	return(CC)
}

# parameter meaning
# Ecoef = ecological coefficient
# Density = maximum density of larvae/pupae
# Wt = total volume of effective water in the system

# development values at a specific temperature, T
# eqn 7 in Morin 2010 paper

Vt <- function(Lt) 
{
	Vt <- 1/Lt
	return(Vt)
}

# parameter meaning
# Lt = length of time in days

# eggs laid by a female at a given temperature T
# derived from El Rayah and Groun in..
# Morin 2010 paper
# this is eqn 8

Et<- function(par9,temp,par10)
{
	Et <- -par9*temp+par10
	return(Et)
}

# parameter meaning
# par9 = constant from El Rayah and Abu Groun
# temp = temp in C
# par10 = constant from El Rayah and Abu Groun

# development values (Vt) of larvae
# eqn 9 in Morin 2010 paper

Vt<- function(par11,par12,par13,par14,par15,par16,par17,temp)
{
	Vt <- if (10 < temp <=18.5)
		Vt<-par11*temp^par12
	else if (18.5<temp<=21)
		Vt<-par13*temp+par14
	else if (temp>21)
		Vt<-par15*temp^2-par16*temp+par17
	return(Vt)
}

# parameter meaning
# pars 11-17 constants
# temp = temp!

# temperature dependent egg survival, Se
# eqn 10 in Morin 2010 paper

Se<- function(par18,par19,par20,par21,par22,par23,temp)
{
	Se <- if (13 < temp)
		Se<-par18
	else if (13 <= temp < 19)
		Se<-par19*exp(-par20*temp)
	else if (19<= temp < 30)
		Se<- par21
	else if (temp >=30)
		Se<- par22*temp-par23
	return(Se)
}

# parameter meaning
# pars 19-23 constants
# temp = temp!

# development time for larvae and pupae
# eqn 11 in Morin 2010 paper
# r(K) is the inverse of time in days required
# for develpment at temp t in kelvin, K
# uses parameteres in table 2 of the paper, which vary for different life stages

rK<- function(RH025,K,HA,HH,TH,par24,par25)
{
	rK <- (RH025*(K/par24)*exp(HA/par25*(1/par24-1/K)))/(1+exp(HH/par25))
	return(rK)
}

# parameter meaning
# RHO25 = ?
# HA = ?
# HH = ?
# TH = ? # table says see text, but no descriptions

# daily survival percentage from egg hatch to adult emergence
# eqn 12 in Morin 2010 paper

Sl<- function(par26,temp,par27,par28,par29)
{
	Sl <- if (12 < temp < 37)
		Sl<- - par26*temp^2+par27*temp-par28
	else if (12 <= temp >= 37)
		Sl<- par29
	return(Sl)
}

# parameter meaning
# pars26-29 constants in eqn
# temp=temp!

# daily survival rate from egg hatch to adult emergence
# eqn 13 in Morin 2010 paper

Sp<- function(par30,Sl,Dt)
{
	Sp <- par30*log10(Sl/Dt)
	return(Sp)
}

# parameter meaning
# par30 = constant 
# Sl = daily survival percentage
# Dt = combined development time for larvae and pupae

# temp-dept gonotrophic cycle
# eqn 14 in Morin 2010 paper

Vg<- function(par31,par32,par33,par34,temp)
{
	Vg <- if (temp < 13)
		Vg<- par31 # zero, 0
	else if (13 <= temp < 32)
		Vg<- 1/(par32*exp(-par33*temp))
	else if (temp >=32)
		Vg<- 1/par34
	return(Vg)
}

# parameter meaning
# pars31-34 constants in eqn
# temp=temp!

# model of adult death rate
# nb this does not have an equation, but is in text on pg 523
# in Morin paper (2010)

DrA <- function(temp,par35) # NB could give this other pars at <0,>40
{
	DrA <- if (temp<0)
		DrA<-0
	else if (0 <= temp < 40)
		DrA<-par35
	else if (temp >=40)
		DrA<-0
}
# parameter meaning
# par35 = constant from literature

