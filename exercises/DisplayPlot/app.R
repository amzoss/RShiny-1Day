#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Adding a simple plot"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          "This panel is empty for now."
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("simplePlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$simplePlot <- renderPlot({
      ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
