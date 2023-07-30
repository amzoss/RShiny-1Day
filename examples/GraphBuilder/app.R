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
library(plotly)

data(mtcars)

numeric_cols <- mtcars %>% select_if(is.numeric) %>% names()

ggplot_themes <- c("theme_bw" = "+ theme_bw()", 
                   "theme_classic" = "+ theme_classic()", 
                   "theme_dark" = "+ theme_dark()", 
                   "theme_gray" = "+ theme_gray()", 
                   "theme_grey" = "+ theme_grey()", 
                   "theme_light" = "+ theme_light()", 
                   "theme_linedraw" = "+ theme_linedraw()", 
                   "theme_minimal" = "+ theme_minimal()", 
                   "theme_test" = "+ theme_test()", 
                   "theme_void" = "+ theme_void()") 

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("ggplot Chart Builder"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          h2("Chart design"),
          selectInput(
            inputId="xvar", 
            label="Choose a variable for the X-axis:",
            choices=numeric_cols,
            selected=numeric_cols[1]
          ),
          selectInput(
            inputId="yvar", 
            label="Choose a variable for the Y-axis:",
            choices=numeric_cols,
            selected=numeric_cols[3]
          ),
          selectInput(
            inputId="theme", 
            label="Choose a built-in theme:",
            choices=ggplot_themes,
            selected=ggplot_themes[5]
          ),
          h2("Annotation"),
          p("To place a text annotation on the graph, type the annotation below and click inside the chart to indicate the correct location."),
          textInput(
            inputId="annotation",
            label="Type an annotation:"
          ),
          sliderInput(
            inputId="textSize",
            label="Change the size of the text:",
            min=1,
            max=20,
            value=8
          ),
          h2("Interactivity"),
          checkboxInput(
            inputId="interactive",
            label="Make it interactive?"
          )
        ),

        # Show a plot of the generated distribution
        mainPanel(
          uiOutput("plotChooser"),
          uiOutput("plotStr")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
    coords <- reactiveVal()  
    
    observeEvent(input$plot_click, {
      coords(list(x = round(input$plot_click$x, digits=1), 
                  y = round(input$plot_click$y, digits=1)))
    })
  
    str_plot <- reactive({
      chart <- paste0(
        "ggplot(mtcars, aes(x=",input$xvar,", y=",input$yvar,")) + geom_point() ", input$theme
      )
      
      if(input$annotation != "" & !(is.null(coords()))) {
        chart <- paste0(chart, " + annotate(\"text\", x=",coords()[["x"]],", y=",coords()[["y"]],", label=\"", input$annotation, "\", size=",input$textSize,")")
      }
      
      if(input$interactive) {
        chart <- paste0("plot<-",chart,"; \nggplotly(plot)")
      }
      
      return(chart)
      
    })
    
    output$distPlot <- renderPlot({
        eval(parse(text=str_plot()))
    })
    
    output$plotStr <- renderUI({
      tagList(
        strong("Code to create this plot:"),
        p(str_plot())
      )
    })
    
    output$myplotly <- renderPlotly({
      eval(parse(text=str_plot()))
    })
    
    output$plotChooser <- renderUI({
      if (input$interactive) {
        plotlyOutput("myplotly")
      }
      else {
        plotOutput("distPlot", click = "plot_click")
      }
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
