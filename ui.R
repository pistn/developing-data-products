library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Classification Demo"),
  sidebarPanel(
    radioButtons("clsfier", "Classifier",
                 c("KNN" = "knn",
                   "SVM" = "svm",
                   "Random Forest" = "rf")),
    
    selectInput("dataset1", "Choose a predictor : x", 
                choices = c("Sepal L.", "Sepal W.", "Petal L.","Petal W.")),
   
    selectInput("dataset2", "Choose a predictor : y", 
                choices = c("Sepal W.","Sepal L.",  "Petal L.","Petal W."))
  ),
  
  mainPanel(
    p('Plot of classification boundaries'),
    plotOutput('plot')
    
  )
))