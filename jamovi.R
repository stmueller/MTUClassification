#Check Jamovi and find Jamovi
jmvtools::check(home = 'C:/Program Files/jamovi 0.7.3.0 Beta 3')
jmvtools::check()
options(jamovi_home= 'C:/Program Files/jamovi 0.7.3.0 Beta 3')

# Install a Module
jmvtools::install()

#Creating a Module
jmvtools::create('MTUClassification')

#Creating an Analysis
setwd("C:/Users/komal/Desktop/jmvbaseR-master (1)")
setwd('MTUClassification')
jmvtools::addAnalysis(name = 'DecisionTree', title= 'Classification using Decision Tree')
jmvtools::addAnalysis(name = 'RandomForest', title= 'Classification using Random Forest')

jmvtools::install()
jmvtools::check()

