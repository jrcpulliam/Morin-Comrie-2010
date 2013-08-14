## Function Telephone, Pulliam Lab, August 2013
## Functions'code practice (Please check where i am wrong, as when running the script, it
## is giving me unexpected symbol)

#Function 1
F_1<-function(a,x,b){y<- 1/(1+exp(-(a*x+b)))return(y)}
##Function 2
F_2<-function(a,x,b){y<- 1/(b*sqrt(2*pi))^(exp(-{(x-a)^2/2*b^2}))return(y)}
##Function 3
F_3<-function(a,x,b){y<-1-exp(-(x/b)^a)return(y)}
##Function 4
F_4<-function(a,x,b){y<-(a/b)*(x/b)^(a-1)exp(-(x/b)^a)return(y)}
##Function 5
F_5<-function(a,x,b){y<-((a*b*x)^(a-1))*(1-x^a)^(b-1)return(y)}
##Function 6
F_6<- function(a,x,b){y<-1-(1-x^a)^b return(y)}
## Function 7
F_7 <- function(a,x,b){y<-a*(x-b)^2 return(y)}
##Function 8
# f8(x)= (ab)e(ax)........see paper
## Function 9
F_9<- function (a,x,b){y<-(a*x)/(1+x/b)return(y)}
##Function 10....see paper
## Function 11 
F_11<-function(a,x,b){y<-(a*x)/(a*x)-(1-a)^b return(y)}
##Function 12...see paper
