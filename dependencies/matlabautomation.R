# MATLAB Automated Script Processing
# UCSD Lo Lab Group Social Network Analysis Script
# MIT License
# Written by Albert Chai, Andrew S. Lee and Joshua P. Le

# This script will call the MATLAB runtime using the packages matlabr and R.matlab in order to run the 
# matrix generation for R to process the data. 

# Changes working directory to the dataprocessing folder
projectDir <- getwd()
setwd('dataprocessing')

# Checks if any default files are present, if present remove files
if(file.exists('edge.csv') == TRUE){
  file.remove('edge.csv')
}
if(file.exists('weight.csv') == TRUE){
  file.remove('weight.csv')
}
if(file.exists('master-edge-weight.csv') == TRUE){
  file.remove('master-edge-weight.csv')
}
if(file.exists('tempAutomated.csv') == TRUE){
  file.remove('tempAutomated.csv')
}

# Loads the necessary files that will be imported into R
# Checks if files have headers
headerinput <- readline('Does your data file have a header? [y/n]: ')
ifelse(headerinput == "y" || headerinput == "Y", headervalue <- TRUE, headervalue <- FALSE)
# Imports RAW data file into R
raw_matrix_data <- read.csv(file.choose(), header = headervalue)

# Exports the file as temporary .csv
write.csv(raw_matrix_data, file = "tempAutomated.csv", 
          col.names = FALSE, 
          row.names = FALSE, 
          fileEncoding = "utf8",
          na = "",
          quote = FALSE)

# Runs the Matlab Execution Library
run_matlab_script('automatedmatrixprocessor.m', verbose = TRUE, desktop = FALSE)

# Imports processed RAW data file into R
raw_data <- read.csv('master-edge-weight.csv', header = headervalue)

# Create the edge and weight lists from raw_data file as data.frames
cat('Import your raw q/r data file...\n')
edge_list <- data.frame(raw_data$source, raw_data$target)

# Requests if user attribute file is present
attribute_data_present <- readline('Do you have attribute data that you want to include? [y/n]: ')
if(attribute_data_present == "Y" || attribute_data_present == "y"){
  attribute_data <- read.csv(file.choose(), header = headervalue)
}

# Sets datacollect variable to TRUE
datacollect <- 1

# Returns the working directory back to the main
setwd(projectDir)

# Based on main menu option, execute auto or return to menu
core <- 1
if(autoscriptrun==1)
{
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/netinticonfig.R')
}
if(autoscriptrun==0)
{
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/mainmenu.R')
}
