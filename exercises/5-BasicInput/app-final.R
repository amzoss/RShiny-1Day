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
            selectInput(
              inputId = "num",
              label = "Select a number:",
              choices = c("1","2","3")
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
          imageOutput(outputId = "image")
        )
    )
)

# Define server logic
server <- function(input, output) {

  output$image <- renderImage({
    list(src = paste0("www/number", input$num, ".jpg"),
         width = 150,
         alt = paste0("The number ", input$num, "."))
  }, deleteFile = FALSE)
  
}

# Run the application 
shinyApp(ui = ui, server = server)
