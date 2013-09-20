# run.DyMSiM.R
#
# Evaluation script for Pulliam Lab exercise.

rm(list=ls())

# This file will contain inputs to the function DyMSiM and will be used to test your model
# output
# load("testdata.Rdata")
load("~/Dropbox/LabMeetings/MorinComrie2010/testdata.Rdata")

# You should have a file named DyMSiM.R that runs any files necessary to run your model
source("DyMSiM.R")

# You should define a function called DyMSiM that requires the following three input variables:
# date, temp, and precip (see below for more details). The model should return a list containing
# the following elements: daily.CxQ (a vector of daily predicted mosquito populations, for the date
# range defined by date), weekly.CxQ (a vector of weekly smoothed model output, as shown in Figures
# 2 and 3 of Morin and Comrie 2010, for the date range defined by date), and num.years (the number
# of years covered by dates) 
DyMSiM(date, # An n-length vector of dates
			 temp, # An n-length vector of daily mean temperatures (in deg C)
			 precip) # An n-length vector of daily water input (precipitation and/or irrigation) (cm)
