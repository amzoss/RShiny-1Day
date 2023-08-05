#
# Exercise 8: Plots and brushes
#

library(shiny)
library(tidyverse)

starwars_chars <- starwars %>% na.omit() %>% mutate(name=fct_reorder(as_factor(name),birth_year))

ui <-   
  fluidPage(
    
    # first item: main title appearing in the navigation bar
    titlePanel("Exercise 8: Plots and brushes"),
    
    # first row is just a text element stretching across entire width
    fluidRow(column(p(em("Instructions: Drag a box on the left plot to highlight points on the right plot.")),width=12)),
    
    # second row has two equal-sized elements: the two charts
    fluidRow(
      splitLayout(
        
        # Include placeholders for two plots. The first plot should also list
        # an argument called "brush" to define a brush.
        # See ?plotOutput for documentation about the brush argument.
         
      )
    )
  )

# Define server logic
server <- function(input, output) {

  selectedData <- reactive({
    
    # Create a reactive function that responds to the brush from the first plot
    # and creates a subset of the full dataset.
    # Hint: see the help for ?brushedPoints
    
  })
  
  # Create a name for the output object for the first plot
  __________ <- renderPlot({
    
    # The first plot doesn't respond to any of the inputs directly;
    # the brush makes it an input itself.
    
    ggplot(data=starwars_chars, aes(birth_year, name)) +
      geom_point(size=5)
    
  })
  
  # Create a name for the output object for the second plot

  __________ <- renderPlot({
    
    # The second plot should respond to the selectedData subset to add some 
    # red points on top of the black.
    # Hint: when you use a reactive object, you have to include () after the name 
    # (e.g., "selectedData()")
    
    ggplot(data=starwars_chars, aes(height,mass)) +
      geom_point(size=5) + 
      # add red dots here
      
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
