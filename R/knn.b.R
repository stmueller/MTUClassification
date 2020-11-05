
# This file is a generated template, your changes will not be overwritten

knnClass <- R6::R6Class(
    "knnClass",
    inherit = knnBase,
    private = list(
        .run = function() {
            footerResults <- self$results$footer
          
            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)

            #  Getting the data object
            data <- self$data
            
            # Getting the the options object for right side screen
            dv <- self$options$dv
            idv <- self$options$idv
            k <- self$options$k
            split <- self$options$split
            isNorm <- self$options$isNorm
            footer <- "KNN Classfication Module build by Data Science Graduate canditates at Michigan Technological University."
            
            # Intailize thee variables (not needed)
            #dependentVariable <- data.frame()
            #inDependentVariable <- data.frame()
            
            knn_fit <- c()
            trainIndex <- c()
            confMatrix <- c()
            testClass <- c()
            
            if(!(is.null(dv) & is.null(idv))) {
                
                dependentVariable <- factor(data[, dv])
                inDependentVariable <- data[, idv]
                ##Right now, inDependentVariable could go wrong, because it might contain a
                ## factor. knn requires numeric values.  So, if any of these is a factor, we need to 
                ## could do something like contr.treatment() or contr.sum() to recode into independent integers. 
                ## for now, let's just force them to enter numeric values.
  
                newdat <- data.frame(dummy=rep(0,nrow(data)))
                
                for(var in colnames(data))
                {
                  if(is.factor(data[[var]]))
                  { 
                    newdat <- data.frame(newdat, contr.sum(data[[var]]))

                  }else{
                    newdat <- data.frame(newdat, data[[var]]  )
                  }    
                }
                
                # Standardize/Normalize if necessary.
                if(self$options$isNorm)
                {
                        if(is.data.frame(inDependentVariable) | is.matrix(inDependentVariable)) {
                            for(var in 1:ncol(inDependentVariable)) {
                                tmp <- inDependentVariable[, var]
                                inDependentVariable[, var] <- (tmp - mean(tmp, na.rm=T)) / sd(tmp, na.rm=T)
                            }
                        } else {
                            inDependentVariable <- (inDependentVariable - mean(inDependentVariable, na.rm=T)) / sd(inDependentVariable, na.rm=T)
                        }
                }
                
                # Creating the data object.  This will cause us some problems when it is turned into a matrix, 
                ## if the outcomes are factors as they should be.
                data <- inDependentVariable  ##data.frame(cbind(inDependentVariable, dependentVariable))
                
                
                ## 75% of the sample size
                smpSize <- floor((split / 100) * nrow(data))
                
                ## set the seed to make your partition reproductible
                #set.seed(123)
                trainIndex <- sample(seq_len(nrow(data)), size = smpSize)
                
                # Splitting test and train.  transforming to a matrix will 
                # cause problems for factor-predictors.
                train <- as.matrix(data[trainIndex, ])
                test <- as.matrix(data[-trainIndex, ])
                
                # Spliting the class label
                trainClass <- dependentVariable[trainIndex]
                testClass <- dependentVariable[-trainIndex]
      
                
                # Fiting the KNN model
                knn_fit <- class::knn(train, test, trainClass, k)
                
                # Evaluating the model
                confMatrix <- caret::confusionMatrix(knn_fit, testClass)
            }
            
            # Results varaible for the right hand side screen
            predictedResults <- self$results$predicted
            actualResults <- self$results$actual
            confMatResults <- self$results$confMat
            footerResults <- self$results$footer
            
            # Storing the results to right side panel  content
            predictedResults$content <- knn_fit
            actualResults$content <- as.factor(testClass)
            confMatResults$content <- confMatrix
            footerResults$content <- footer
        })
)
