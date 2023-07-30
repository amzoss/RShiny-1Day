#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Image Chooser"),

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

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$image <- renderImage({
    list(src = paste0("www/number", input$num, ".jpg"),
         width = 150,
         alt = paste0("The number ", input$num, "."))
  }, deleteFile = FALSE)
  
}

# Run the application 
shinyApp(ui = ui, server = server)
