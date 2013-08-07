# this just writes the parameters used throughout the work to a file
# file can be edited later
# file can be read in later
library(data.table)

pars.constant = data.table(name=c("par1","par2","par3","par4","par5",
												 "par6","par7","par8","par9","par10",
												 "par11","par12","par13","par14","par15",
													"par16","par17","par18","par19","par20",
													"par21","par22","par23","par24","par25",
													"par26","par27","par28","par29","par30",
													"par31","par32","par33","par34","par35"),
									value=c(2.1,
													273.2,
													0.2163108,
													0.9671396,
													0.00860,
													186,
													0.39795,
													24,
													7.38,
													372.71,
													0.0012,
													1.9422,
													1.1193,
													0.2936,
													0.0037,
													0.1661,
													2.5198,
													0.97,
													54.259,
													0.3114,
													0.22,
													0.0876,
													2.3577,
													298.15,
													1.987,
													0.0057,
													0.2826,
													2.5551,
													0.1554,
													10,
													0,
													17.75,
													0.613,
													2.5,
													0.123))
pars.constant # check values
write.csv(pars.constant,file = "pars.constant.csv",row.names=F)

# now for variable parameters

pars.var = data.table(name=c("RH025","HA","HH","TH"),
											INSTAR1=c(1.23439,
																27534.92,
																37071.82,
																301.00),
											INSTAR2=c(1.4295,
													 			28219.93,
													 			39340.77,
													 			301.37),
											INSTAR3=c(0.94308,
																20767.22,
																36213.96,
																304),
											INSTAR4=c(0.3123,
																12629.46,
																140281.42,
																308.31),
											PUPAE=c(0.5549,
															15648.63,
															43983.41,
														306.6),
											TOTAL=c(0.21945, # could be generic values, but why is this so low?
															28049.98,
															35362.18,
															298.6))
pars.var # check valueswrite.csv(pars.constant,file = "pars.constant.csv",row.names=F)
write.csv(pars.var,file = "pars.var.csv",row.names=F)
