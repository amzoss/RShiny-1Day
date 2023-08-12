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
            selectInput(inputId = "cyls",
                        label = "Number of cylinders:",
                        choices = cyl_options,
                        selected = "4")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput(outputId = "filteredPlot"),
           tableOutput(outputId = "filteredTable")
        )
    )
)

# Define server logic
server <- function(input, output) {
  
  subsetData <- reactive({
    mtcars %>% dplyr::filter(cyl == input$cyls)
  })

  output$filteredPlot <- renderPlot({
    ggplot(data=subsetData(), aes(x=mpg, y=disp)) + geom_point()
  })
  
  output$filteredTable <- renderTable({
    subsetData()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
