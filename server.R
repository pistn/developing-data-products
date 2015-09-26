library(shiny)
library(datasets)


library(shiny)
shinyServer(
  function(input, output) {
    datasetInput <- reactive({
      switch(input$dataset1,
             "Sepal L." = 1,
             "Sepal W." = 2,
             "Petal L." = 3,
             "Petal W." = 4 )
      switch(input$dataset2,
             "Sepal L." = 1,
             "Sepal W." = 2,
             "Petal L." = 3,
             "Petal W." = 4 )
      
      
      
      
 #########################start     
      if(input$dataset1==input$dataset2){validate(
        need(input$data != "", "Please select different x from y")
      )}
      else{
      train <- rbind(iris3[1:50,c(input$dataset1,input$dataset2),1],
                     iris3[1:50,c(input$dataset1,input$dataset2),2],
                     iris3[1:50,c(input$dataset1,input$dataset2),3])
      cl <- factor(c(rep("Setosa",50), rep("Versicolor",50), rep("Virginica",50)))
      
      require(MASS)
      
      test <- expand.grid(x=seq(min(train[,1]-1), max(train[,1]+1),
                                by=0.1),
                          y=seq(min(train[,2]-1), max(train[,2]+1), 
                                by=0.1))
      train<-data.frame(train)
      names(train)<-c("x","y")
      ##################################################################randomforest
      if(input$clsfier=="rf"){
      
       require(class)
       library(randomForest)
        model<-randomForest(train,cl)
        classif<-predict(model,test)
        require(dplyr)
        
        dataf <- bind_rows(mutate(test,
                                  class="Versicolor",
                                  prob_cls=ifelse(classif==class,
                                                  1, 0)),
                           mutate(test,
                                  class="Virginica",
                                  prob_cls=ifelse(classif==class,
                                                  1, 0)),
                           mutate(test,
                                  class="Setosa",
                                  prob_cls=ifelse(classif==class,
                                                  1, 0)))
        
        require(ggplot2)
        ggplot(dataf) +
          geom_point(aes(x=x, y=y, col=class),
                     data = mutate(test, class=classif),
                     size=1.2) + 
          geom_contour(aes(x=x, y=y, z=prob_cls, group=class, color=class),
                       bins=2,
                       data=dataf) +
          geom_point(aes(x=x, y=y, col=class),
                     size=3,
                     data=data.frame(x=train[,1], y=train[,2], class=cl))
        
      }
      
      ##################################################################
      
      
      ###################################knn
      else if(input$clsfier=="knn"){
      
        library(class)
      
      classif <- knn(train, test, cl, k = 15, prob=TRUE)
      prob <- attr(classif, "prob")
      
      require(dplyr)
      
      dataf <- bind_rows(mutate(test,
                                class="Versicolor",
                                prob_cls=ifelse(classif==class,
                                                1, 0)),
                         mutate(test,
                                class="Virginica",
                                prob_cls=ifelse(classif==class,
                                                1, 0)),
                         mutate(test,
                                class="Setosa",
                                prob_cls=ifelse(classif==class,
                                                1, 0)))
      
      require(ggplot2)
      ggplot(dataf) +
        geom_point(aes(x=x, y=y, col=class),
                   data = mutate(test, class=classif),
                   size=1.2) + 
        geom_contour(aes(x=x, y=y, z=prob_cls, group=class, color=class),
                     bins=2,
                     data=dataf) +
        geom_point(aes(x=x, y=y, col=class),
                   size=3,
                   data=data.frame(x=train[,1], y=train[,2], class=cl))
      
      
      }
      ##################################################################
      
      ######################################svm
      else if(input$clsfier=="svm"){
      
      
      library(e1071)
      model<-svm(train,cl)
      classif<-predict(model,test)
      ################################################################
      require(dplyr)
      
      dataf <- bind_rows(mutate(test,
                                class="Versicolor",
                                prob_cls=ifelse(classif==class,
                                                1, 0)),
                         mutate(test,
                                class="Virginica",
                                prob_cls=ifelse(classif==class,
                                                1, 0)),
                         mutate(test,
                                class="Setosa",
                                prob_cls=ifelse(classif==class,
                                                1, 0)))
      
      require(ggplot2)
        ggplot(dataf) +
        geom_point(aes(x=x, y=y, col=class),
                   data = mutate(test, class=classif),
                   size=1.2) + 
        geom_contour(aes(x=x, y=y, z=prob_cls, group=class, color=class),
                     bins=2,
                     data=dataf) +
        geom_point(aes(x=x, y=y, col=class),
                   size=3,
                   data=data.frame(x=train[,1], y=train[,2], class=cl))
     
       
      }
      
      } 
      
      
    })
    
    output$plot <- renderPlot({datasetInput()})
    })
  
