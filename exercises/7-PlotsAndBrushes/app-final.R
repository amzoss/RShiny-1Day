#
# Exercise 7: Plots and brushes
#

library(shiny)
library(tidyverse)

starwars_chars <- starwars %>% na.omit() %>% mutate(name=fct_reorder(as_factor(name),birth_year))

ui <-   
  fluidPage(
    
    # first item: main title appearing in the navigation bar
    titlePanel("Exercise 7: Plots and brushes"),
    
    # first row is just a text element stretching across entire width
    fluidRow(column(p(em("Instructions: Drag a box on the left plot to highlight points on the right plot.")),width=12)),
    
    # second row has two equal-sized elements: the two charts
    fluidRow(
      splitLayout(
        
         # The first chart has a brush defined.
         # The brush talks to the selectedData() function in the server.
         plotOutput("swPlot1", brush = "plot1_brush"),
         plotOutput("swPlot2")
         
      )
    )
  )

# Define server logic
server <- function(input, output) {

  # a special reactive function responds to the Star Wars plot brush
  # and creates a subset of the full dataset for highlighting
  selectedData <- reactive({
    brushedPoints(starwars_chars, input$plot1_brush)
  })
  
  output$swPlot1 <- renderPlot({
    
    # the first plot doesn't respond to any of the inputs directly;
    # the brush makes it an input itself
    
    ggplot(data=starwars_chars, aes(birth_year, name)) +
      geom_point(size=5)
    
  })
  
  output$swPlot2 <- renderPlot({
    
    # The second plot should respond to the selectedData subset to add some 
    # red points on top of the black.
    # Hint: when you use a reactive object, you have to include () after the name 
    # (e.g., "selectedData()")
    
    ggplot(data=starwars_chars, aes(height,mass)) +
      geom_point(size=5) + 
      geom_point(data=selectedData(), aes(height,mass), color="red", size=5)
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
