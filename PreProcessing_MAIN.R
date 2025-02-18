##########################################################################
#                                                                        #
#                     PREPROCESSING EBS APP DATA                         # 
#                          ----- main -----                              #
#                                                                        #
##########################################################################

# --------------------------------------- # 
# HOW TO USE THIS SCRIPT
# --------------------------------------- #

# This script handles the pre-processing of the App data by calling 
# the relevant functions included in the PreProcessing R-package. 
# For more details regarding the project structure, see DOCUMENTATION/README. 

# ----
# Steps for running this script:

# 1. Simply run all lines of code included in "0.prepare"
# 2. In "1. run preprocessing", change "path" & "pathOUT" to the 
#    according location on your machine
#    --> more information on recommended file structure in DOCUMENTATION/README
# 3. Run line "data <- PreProcessing(path, pathOUT)"
# 4. Wait - the preprocessing functons will print updates into the console. 
# ----

# --------------------------------------- # 
# 0. prepare
# --------------------------------------- #

# ---- 
# A: clear global environment/workspace
rm(list= ls()) 

# ----
# B: install/load dependencies
#   -->  # we need devtools to install the local package
if (!require("devtools")) {
  install.packages("devtools", dependencies = TRUE)}


# ----
# C: get preprocessing package
#   --> this loads all functions from GitHub repo
#   --> by loading the package, we can use them in our preprocessing
devtools::install_github("lkumle/EBSPreProcessing")

library(EBSPreProcessing) # load package

# --------------------------------------- # 
# 1. RUN PREPROCESSING
# --------------------------------------- #

# ----
# A: specify location of data & where preprocessed data should be stored to
#    --> ATTENTION: the pre-processing will try to combine ALL "csv" files in the data
#                   folder. Please store the "key"-files in a seperate folder.
#    --> SEE: suggested folder structure as outlined in DOCUMENTATION/README

path = "~/Dropbox/MoodTrackerApp/Data/csv/" # this is where the data is
pathOUT = "~/Dropbox/MoodTrackerApp/Data/preprocessed/" # this is where data is saved to


# ----
# B: Run actual pre-processing
#    -->  this line will save the finished data frame into the workspace
#    --> if you only want to save the data to file, comment out this line and use line below
#    --> see "keys_preprocessedData.csv" for description and naming of variables 
data <- PreProcessing(path, pathOUT) 


#    --> only save data to file: 
# PreProcessing(path, pathOUT, return = F)





