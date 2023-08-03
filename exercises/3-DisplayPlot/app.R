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
