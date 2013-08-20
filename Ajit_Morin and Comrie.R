#### Morin and Comrie, 2010
#### Equation 8

#### Equation 9: Equations for Develeopment value for Cx. quinquefasciatus eggs dependent on a given temperature
a<-  0.0012
b<-  1.9422
c<-  1.1193
d<-  0.2936
e<-  0.0037
f<- -0.1661
g<-  2.5198
#Equation 9a
dev.value<-function(t,a,b){if(t>10 & t<=18.5){y<-(a*t^b)
                                              return(y)}}
#Equation 9b
dev.value<-function(t,c,d){if(t>18.5 & t<=21){y<-(c*t+d)
                                              return(y)}}
#Equation 9c
dev.value<-function(t,e,f,g){if(t>21){y<-(e*t^2+f*t+g)
                                      return(y)}}

#### Equation 10: Equations for daily survival rate of Cx.quinquefasciatus eggs dependent on temperature
a=54.259
b= -.3114
c= .0876
d= -2.3577
#Equation 10a 
dsurv_rate<-function(t){if (t<13){y<-0.97 
                                  return (y)}}
#Equation 10b (i assumed T19 of the equation as T<19)
dsurv_rate<-function(t,a,b){if(t>=13 & t<19){y<-a*exp(b*t)
                                             return (y)}}
#Equation 10c (i assumed T30 as T<30)
dsurv_rate<-function(t){if(t>=19 & t<30){y<-0.22 
                                         return (y)}}
#Equation 10d
dsurv_rate<-function(t,c,d){if(t>=30){y<-c*t+d 
                                      return(y)}}

