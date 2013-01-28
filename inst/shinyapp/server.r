library(shiny)
library(plyr)
library(ggplot2)
library(rvertnet)
library(doMC)

## Set up server output
shinyServer(function(input, output) {
#   load("speciesdata.rda")
  
  datasetInput <- reactive(function() {
    species <- input$spec
    species2 <- strsplit(species, ",")[[1]]
    group <- input$group
    maxreturn <- input$num
    #     df <- vertoccurrence(t=species, grp="bird", num=maxreturn)
    registerDoMC(cores=4)
    llply(species2, function(x) vertoccurrence(t=x, grp=group, num=maxreturn), .parallel=TRUE)
  })
  
  # define function for server plot output
  output$vertnetplot <- reactivePlot(function() {
#     species <- input$spec
#     maxreturn <- input$num
#     registerDoMC(cores=4)
#     df <- llply(species, function(x) vertoccurrence(t=x, grp="bird", num=maxreturn), .parallel=TRUE)
    print(vertmap(input=datasetInput()))
  })
  
  output$downloadData <- downloadHandler(
    filename = 'data.csv',
#     content = function(file) { write.csv(mtcars, file) }
        content = function(file) { write.csv(ldply(datasetInput()), file) }
  )
  
  output$cbt <- reactiveText(function(){})

  
})