#
# Exercise 4: Testing Different Outputs
#

library(shiny)
library(tidyverse)

# Define UI
ui <- navbarPage(
  
  title = "Exercise 4: Testing Different Outputs",

  # Add separate pages for different outputs; include a title for each page
  
  # Page 1: image output
  
  # Page 2: table output
  
  # Page 3: verbatim text output
  
  # Page 4: text output
  
  # Page 5: html output
  
)

# Define server logic
server <- function(input, output) {
  
  # Add render code for the different outputs expected by the different pages
  
  # Page 1: render image
  # (Use one of the images in the "www" folder, like "www/number1.jpg".)
  
  # Page 2: render table
  # (You can use a built-in dataset, like "mtcars".)
  
  # Page 3: render print
  # (You can just call the name of the dataset, since that will generate output
  # that can be printed.)
  
  # Page 4: render text
  # (Instead of calling a whole dataset, you need to call something that can 
  # easily be converted into text, like a vector. You can use "names(mtcars)" here.)
  
  # Page 5: render UI
  # (To render HTML elements for the UI, you can use HTML functions imported into 
  # the shiny package. See a list by typing "?shiny::reexports". Some examples are:
  # p() for paragraph, h1() and h2() for headings, img() for an image. If you want to
  # use more than of these HTML functions, you need to list them inside the function
  # tagList().)

}

# Run the application 
shinyApp(ui = ui, server = server)
