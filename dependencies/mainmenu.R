# Main Menu R Script
# Allows for user to select options without having to entirely reload or restart the analysis process
# UCSD Lo Lab Group Social Network Analysis Script
# MIT License
# Written by Albert Chai, Andrew S. Lee, and, Joshua P. Le

# Sets script version for print out
scriptversionread <- "3.0-100418"
# Capture R version system information
cap_version <- version

# Loads Introduction Prompt
# Prompts user to make a selection
cat('Social Network Analysis Script for Education v2.1\n')
cat('Please select an option from the following:\n')
cat('-----Base Tools-----\n')
cat('0. Quit Script\n')
cat('1. Automatic Script Run\n')
cat('2. Clear Environmental Variables\n')
cat('3. Data Entry\n')
cat('4. Network Initial Configuration\n')
cat('5. Plot Network\n')
cat('6. Parameters Analysis\n')
cat('7. Subgroups Analysis\n')
cat('8. Statistical Analysis\n')
cat('9. Summary Report Print - Text Option\n')
cat('-----Optional Tools-----\n')
cat('100. Text Counter Analyzer\n')
cat('101. Restore Last Known g_original Graph Adj Matrix\n')
cat('102. MATLAB Automation Script from R - Data Entry\n')
cat('103. Markdown HTML Summary Report Print\n')
menuselect <- readline('Selection: \t')

# Switch Options
# Terminates script based on false statement
validMenuoptions <- c(0,1,2,3,4,5,6,7,8,9,100,101,102,103)
if(sum(menuselect == validMenuoptions) == 1){
if(menuselect==0){
  stopscriptfunct <- 1
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/endScript.R', echo = FALSE)
  stopifnot(stopscriptfunct == 0)
}
# Runs all scripts automatically based on user input conditions
if(menuselect==1){
  # Sets Universal variable for all scripts to run automatically (as in version 1.0) based on input
  autoscriptrun <- 1
  # Begins launching the first script process
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/dataimporter.R')
}
# Clears environmental variables upon user request
if(menuselect==2){
  rm(list=ls())
  # Initialize Loader Variables
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/varloader.R')
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/mainmenu.R')
}
# Loads Data Entry option
if(menuselect==3){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/dataimporter.R')
}
# Loads Network Initial Configuration option
if(menuselect==4){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/netinitconfig.R')
}
# Loads Network Plot option
if(menuselect==5){
    autoscriptrun <- 0
    source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/plot.R')
}
# Loads Core Analysis option
if(menuselect==6){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/core.R')
}
# Loads Subgroups Analysis Option
if(menuselect==7){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/subgroups.R')
}
# Loads Statistical Analysis Section
if(menuselect==8){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/stats.R')
}
# Loads Summary and Print Options Statistics
if(menuselect==9){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/summary.R')
}# Returns the working directory back to the main

# Loads the Text Counter Analyzer
if(menuselect == 100){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/textcounter.R')
}
# Restores g_original variable
if(menuselect == 101){
  autoscriptrun <- 0
  g <- g_original
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/mainmenu.R')
}
# Loads the MATLAB Automation Script
if(menuselect == 102){
  autoscriptrun <- 0
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/matlabautomation.R')
}
# Loads the Markdown HTML Summary Generator
if(menuselect == 103){
  autoscriptrun <- 0
  download.file('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/summaryMarkdown.R','summaryMarkdown.R')
  rmarkdown::render('summaryMarkdown.R', output_file = paste0(project_title,'.html'))
  file.remove('summaryMarkdown.R')
  source('https://raw.githubusercontent.com/ucsd-lo-group/graphical-network-tool/master/dependencies/mainmenu.R')
}
}
