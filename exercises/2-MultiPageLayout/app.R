#
# Exercise 2: Multi-Page Layout
#

library(shiny)

# Define UI
ui <- 
  # Start with a page that creates a navigation bar at the top. We will
  # add a different page, or tab, for several different kinds of layouts.
  # Make sure to specify the title of the page.
  
  # Create four pages, based on the instructions below. In the different
  # sections of the pages, you can include any static content you like --
  # plain text or HTML tags.
  
  # For page 1, test a sidebar layout.
  
  # For page 2, test a tabset panel.
  
  # For page 3, test a navigation list panel.
  
  # For page 4, test anything else you'd like to test, based on what you see
  # in the cheat sheet.

# Define server logic
server <- function(input, output) {
  
  # We can ignore this for now.
  
}

# Run the application 
shinyApp(ui = ui, server = server)
