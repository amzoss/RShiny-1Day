#
# Exercise 1: Basic Layout
#

# Shiny layout guide:
# https://shiny.posit.co/r/articles/build/layout-guide/

library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel(title="Exercise 1: Basic Layout"),
  fluidRow(column(width = 12,
                  p("This column will take up the full width of the screen."))),
  fluidRow(column(width = 4,
                  p("This column will take up one third of the width of the screen."),
                  img(src="number1.jpg", width="150px")),
           column(width = 4,
                  p("This column will take up one third of the width of the screen."),
                  img(src="number2.jpg", width="150px")),
           column(width = 4,
                  p("This column will take up one third of the width of the screen."),
                  img(src="number3.jpg", width="150px"))
           )
)

# Define server logic
server <- function(input, output) {

  # We can ignore this for now.
  
}

# Run the application 
shinyApp(ui = ui, server = server)
