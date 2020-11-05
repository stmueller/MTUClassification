
# This file is a generated template, your changes will not be overwritten

RandomForestClass <- R6::R6Class(
    "RandomForestClass",
    inherit = RandomForestBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)
          
          #Defining Data object
          dat2<- self$data
          
          #Options
          dep<- self$options$dep
          indep<- self$options$indep
          split<- self$options$split
          footer<- "Random Forest classification"
          ntree<- self$options$ntree
          
          #Initialize Variables 
          d_dep<- data.frame()
          d_indep<- data.frame()
          index<- c()
          
          if(!(is.null(dep) & (is.null(indep))))
          {
            d_dep<- as.factor(dat2[,dep])
            d_indep<- dat2[, indep]
          }
          
          #Creating Data object
          d_data<- cbind(d_dep, d_indep)
          
          
          #Creating index to split data
          size<- floor((split/100)* nrow(d_data))
          index <- sample(seq_len(nrow(d_data)), size = size)
          
          #Splitting data into test and train
          d_train<- as.data.frame(d_data[index, ])
          d_test<- as.data.frame(d_data[-index, ])
          
          
          #Class label(dependent variable)
          d_tr_class<- d_dep[index]
          d_te_class<- d_dep[-index]
          
          #Modelling
          model<- randomForest::randomForest(d_tr_class~., data = d_train, ntree= ntree) 
          
          pred1<- predict(model, d_test)
          
          #Results Variables
          #print(model)
          print(table(d_te_class, pred1))
          textResults <- self$results$text
          #textResults1 <- self$results$text
          #textResults$content <- model
          textResults$content<- table(d_te_class, pred1)
      
        }
    )    
)