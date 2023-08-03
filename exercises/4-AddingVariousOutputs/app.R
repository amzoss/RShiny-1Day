#
# Exercise 4: Testing Different Outputs
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- navbarPage(
  
  title = "Exercise 4: Testing Different Outputs",

  tabPanel(
    title="Output 1: Image", 
    "The placeholder below will display an image based on the R code in the server.",
    imageOutput(outputId = "image")
    ),

  tabPanel(
    title="Output 2: Table", 
    "The placeholder below will display a table of the 'mtcars' dataset based on the R code in the server.",
    tableOutput(outputId = "table")
  ),

  tabPanel(
    "The placeholder below will display the output of the R code in the server, without making it look pretty.",
    title="Output 3: Print", 
    verbatimTextOutput(outputId = "print")
  ),

  tabPanel(
    title="Output 4: Text", 
    "The placeholder below will display the output of the R code in the server, after pasting it together into a single string. It won't work for very complicated output like an entire data frame.",
    textOutput(outputId = "text")
  ),
  
  tabPanel(
    title="Output 5: HTML", 
    htmlOutput(outputId = "html")
  )
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$image <- renderImage({
      list(src = "www/number1.jpg",
           width = 150,
           alt = "The number one.")
    }, deleteFile = FALSE)
    
    output$table <- renderTable({
      mtcars
    }, rownames=TRUE, striped=TRUE)
    
    output$print <- renderPrint({
      mtcars
    })
    
    output$text <- renderText({
      names(mtcars)
    })
    
    output$html <- renderUI({
      tagList(
        h2("A second level heading"),
        p("Testing out using some", strong("formatting"), "inside a paragraph.")
      )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
