
# This file is a generated template, your changes will not be overwritten

DecisionTreeClass <- R6::R6Class(
    "DecisionTreeClass",
    inherit = DecisionTreeBase,
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
        footer<- "Decision Tree classification"
        met <- self$options$method
        minbucket<- self$options$Control
        
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
        d_train<- as.data.frame(d_data[index,])
        d_test<- as.data.frame(d_data[-index,])
        
        
        #Class label(dependent variable)
        d_tr_class<- d_dep[index]
        d_te_class<- d_dep[-index]
        
        #d_test<- d_test[, -d_te_class]
        
        #Modelling
        if(met=="Class")
        {
            model1<-rpart::rpart(d_tr_class~., data = d_train, method = "class", minbucket= minbucket)
        }
        else
        {
            model1<-rpart::rpart(d_tr_class~., data = d_train, method = "anova", minbucket= minbucket)
        }  
        
        pred1<- predict(model1, d_test)
        
        #Results Variables
        text<- print(model1)
        #text1<- print (table(d_te_class, pred1))
        textResults <- self$results$text
        textResults$content<- text
      
        
        image = self$results$plot
        image$setState(model1)
        },
        .plot = function(image, ...)
        {
        plotData <- image$state
        if(!is.null(plotData))
        {
        #d_plot<- dendro_data(plotData)
        #plot<- ggplot() + geom_segment(data=d_plot$segments, aes(x=x, y=y, xend=xend, yend=yend), color="blue") +
        #geom_text(data=d_plot$labels, aes(x=x, y=y, label=label), size=5) +
        #geom_text(data=d_plot$leaf_labels, aes(x=x, y=y, label=label)) +
        #theme_dendro()
        
        plot<- plot(plotData, uniform=TRUE, main="Classification Tree", col= "red" )
        text(plotData, use.n=TRUE, cex=1)
        print(plot)
        }
        TRUE
  
        }
    )
)