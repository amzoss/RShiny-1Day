#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# packages for the HTML widgets
library(DT)
library(plotly)
library(leaflet)
library(sf)
library(networkD3)
library(formattable)
library(upsetjs)

# Define UI
ui <- fluidPage(
  # Application title
  titlePanel("Displaying Interactive Components"),
  
  navlistPanel(
    
  tabPanel(
    title="DataTable",
    DTOutput(
      outputId = "DTtable"
    )
  ),
  tabPanel(
    title="Formattable",
    formattableOutput(
      outputId = "frmtbl"
    )
  ),
  tabPanel(
    title="Plotly",
    plotlyOutput(
      outputId = "plotlyPlot"
    )
  ),
  tabPanel(
    title="Leaflet",
    leafletOutput(
      outputId = "leafletMap"
    )
  ),
  tabPanel(
    title="networkD3",
    forceNetworkOutput(
      outputId = "networkVis"
    )
  ),
  tabPanel(
    title="upsetjs",
    upsetjsOutput(
      outputId = "upsetVis"
    )
  )
  )

)

# Define server logic
server <- function(input, output) {
  
    output$DTtable <- renderDT({
      mtcars
    })
    
    output$frmtbl <- renderFormattable({
      formattable(mtcars %>% arrange(desc(disp)), list(
        area(col = c(disp)) ~ normalize_bar("pink", 0.2)
      ))
    })

    output$plotlyPlot <- renderPlotly({
      plot_ly(
        mtcars,
        x=~mpg,
        y=~disp,
        mode="markers",
        type="scatter"
      )

    })
    
    output$leafletMap <- renderLeaflet({
      
      nc <- st_read(system.file("shape/nc.shp", package="sf")) %>% 
        st_transform(crs = "+proj=longlat +datum=WGS84")
      
      leaflet(nc) %>% 
        #addTiles %>% 
        addProviderTiles(providers$CartoDB.Positron) %>%
        addPolygons(fillColor =  topo.colors(10, alpha = NULL), #"blue",
                    fillOpacity = 0.5,
                    weight = 1,
                    stroke = TRUE,
                    color = "black", 
                    opacity = 1,
                    layerId = ~NAME) 
    })
    
    output$networkVis <- renderForceNetwork({
      src <- c("A", "A", "A", "A",
               "B", "B", "C", "C", "D")
      target <- c("B", "C", "D", "J",
                  "E", "F", "G", "H", "I")
      networkData <- data.frame(src, target)
      simpleNetwork(networkData)
    })
    
    output$upsetVis <- renderUpsetjs({
      listInput <- list(one = c(1, 2, 3, 5, 7, 8, 11, 12, 13), two = c(1, 2, 4, 5, 10), three = c(1, 5, 6, 7, 8, 9, 10, 12, 13))
      upsetjs() %>% fromList(listInput) %>% interactiveChart()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
