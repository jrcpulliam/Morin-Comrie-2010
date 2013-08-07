# load data

data.load <- function(..data names with comma spaces...){
	# Read in full data set
	data.name <- read.csv(paste(getwd(), '/Data/', name, '.data.csv', sep=""), header=T)
}

# should load a csv file from a folder called "Data" in the working directory,
# with the name=name from name.data.csv