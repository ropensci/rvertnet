library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  headerPanel(title=HTML("<a href = \"https://github.com/ropensci/rvertnet\">rvertnet - An R wrapper to the VertNet API</a>")),
  sidebarPanel(
  wellPanel(
#     checkboxGroupInput("spec", "Species to map:",
#                        c('Sharp shinned hawk (Accipiter erythronemius)' = "Accipiter erythronemius",
#                          "Dark eyed junco (Junco hyemalis)" = "Junco hyemalis",
#                          "Wood duck (Aix sponsa)" = "Aix sponsa",
#                          'Bald eagle (Haliaeetus leucocephalus)' = "Haliaeetus leucocephalus",
#                          'Carrion crow (Corvus corone)' = "Corvus corone",
#                          'Australian White Ibis (Threskiornis molucca)'= "Threskiornis molucca",
#                          'Rosy Bee-eater (Merops malimbicus)' = 'Merops malimbicus'
#                        ), selected=c('Carrion crow (Corvus corone)','Bald eagle (Haliaeetus leucocephalus)'))
    textInput(inputId="spec", label="Enter species names, correctly spelt, seperated by commas", value="Haliaeetus leucocephalus,Corvus corone")
  ),
    
  wellPanel(
    selectInput(inputId="group", label="Pick taxonomic group", selected="Birds", choices=
                  c("Birds" = "bird",
                    "Fish" = "fish",
                    "Herps" = "herp"))
  ), 
  
  wellPanel(
    sliderInput(inputId="num",
                label="Max. number of records to return per species",
                min = 1, max = 2000, step = 50, value = 50)
  ),
    
    submitButton("Update View"),
  
    HTML("<br><br>"),
  
    downloadButton('downloadData', 'Download ouput as .csv', class='btn-success')
    
  ),
  
  mainPanel(
    h5("A map of your selected species: Please note that Vertnet is queried for every") ,
    h5("selection so loading times vary.  If you don't get a map it is likely that the VertNet API is down."),
    HTML("<a href= \"http://glimmer.rstudio.com/ropensci/rvertnet2/\">Click for faster version with data pre-loaded.</a>"),
    plotOutput("vertnetplot")
  
  )
  
))