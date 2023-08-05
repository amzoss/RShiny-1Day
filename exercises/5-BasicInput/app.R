#
# Exercise 5: Basic Input
#

library(shiny)

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel("Exercise 5: Basic Input"),

    # Sidebar with a select input for different images 
    sidebarLayout(
        sidebarPanel(
          
          # Insert an input widget that looks like a drop-down list.
          # The drop-down should include the following options: 1, 2, and 3
          
        ),

        # Show a plot of the generated distribution
        mainPanel(
          
          # Insert a placeholder for an image file.
          
        )
    )
)

# Define server logic
server <- function(input, output) {

  # Write the R code that will render an image based on what
  # the user selects in the drop-down input.
  
  # One important thing to note is that the path to the images
  # should contain the "www" directory. This is different from what
  # is required when we use the img() function.
  
}

# Run the application 
shinyApp(ui = ui, server = server)
