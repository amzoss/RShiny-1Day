#
# Exercise 3: Display a Plot 
#

library(shiny)
library(tidyverse)

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel("Exercise 3: Display a Plot"),

    sidebarLayout(
      # Sidebar
      sidebarPanel(
        p("This panel is empty for now.")
      ),
      
      # Main panel
      mainPanel(
        # Fill this out to add a placeholder for the plot
      )
    )
)

# Define server logic
server <- function(input, output) {

  # Fill this out to define the plot
  
  # We can use a built-in dataset, like mtcars.
  # Try using ggplot2 to create a scatterplot with the variables mpg and disp.
    
}

# Run the application 
shinyApp(ui = ui, server = server)
