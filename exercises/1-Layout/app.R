#
# Exercise 1: Basic Layout
#

# Shiny layout guide:
# https://shiny.posit.co/r/articles/build/layout-guide/

library(shiny)

# Define UI
ui <- 
  # Start with a page that is suitable for creating rows. Add a title panel. 
  # Under the title, add two rows. 
  
  # In the first row, create a single column that spans the entire page. 
  # Inside this column, type some text.
  
  # In the second row, create three columns that each take up exactly 1/3 of 
  # the page width. In each column, include a different image. 
  
  # The code to include an image in a page is based on HTML syntax. Here is a
  # sample of a command that would work to insert an image into a column. 

  #   img(src="number1.jpg", width="150px")
  

# Define server logic
server <- function(input, output) {
  
  # We can ignore this for now.
  
}

# Run the application 
shinyApp(ui = ui, server = server)
