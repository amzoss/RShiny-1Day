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

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel("Adding a simple plot"),

    sidebarLayout(
        # Sidebar
        sidebarPanel(
          "This panel is empty for now."
        ),

        # Main panel
        mainPanel(
           plotOutput("simplePlot")
        )
    )
)

# Define server logic
server <- function(input, output) {

    output$simplePlot <- renderPlot({
      ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
