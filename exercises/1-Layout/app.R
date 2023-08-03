#
# Exercise 1: Basic Layout
#

# Shiny layout guide:
# https://shiny.posit.co/r/articles/build/layout-guide/

library(shiny)

# Define UI for application that draws a histogram
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

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
