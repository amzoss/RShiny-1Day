#
# Exercise 7: Reactive Data
#

library(shiny)
library(tidyverse)

cyl_options <- sort(unique(mtcars$cyl))

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel("Exercise 7: Reactive Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(

          # Add a select input using the values of the mtcars "cyl" column
          # (calculated above)
          
        ),

        # Show a plot of the generated distribution
        mainPanel(
          
          # Add a plot placeholder and a table placeholder.

        )
    )
)

# Define server logic
server <- function(input, output) {
  
  # Create a reactive function that filters mtcars based on the value from the
  # select input.
  
  # Create render functions for a plot and a table that both use the dataset 
  # created by the reactive function.
  
}

# Run the application 
shinyApp(ui = ui, server = server)
