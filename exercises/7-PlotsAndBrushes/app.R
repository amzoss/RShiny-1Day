#
# Exercise 7: Plots and brushes
#

library(shiny)
library(tidyverse)

starwars_chars <- starwars %>% na.omit() %>% mutate(name=fct_reorder(as_factor(name),birth_year))

ui <-   
  fluidPage(
    
    # first item: main title appearing in the navigation bar
    titlePanel("Exercise 7: Plots and brushes"),
    
    # Star Wars characters, dual interactive highlight charts
    # first argument is the text that appears in the navbar;
    # next argument is what fills the rest of the page (in this case, a fluid page)
    
               
     # first row is just a text element stretching across entire width
     fluidRow(p(em("Instructions: Drag a box on the left plot to highlight points on the right plot."))),
     
     # second row has two equal-sized elements: the two charts
     fluidRow(
       splitLayout(
         
         # the first chart has a brush defined; 
         # the brush talks to the selectedData() function in the server
         plotOutput("swPlot1", brush = brushOpts(id = "plot1_brush")),
         plotOutput("swPlot2")
       )
     )
   )



# Define server logic
server <- function(input, output) {

  # a special reactive function responds to the Star Wars plot brush
  # and creates a subset of the full dataset for highlighting
  selectedData <- reactive({
    brushedPoints(starwars_chars, input$plot1_brush)
  })
  
  # the first plot doesn't respond to any of the inputs directly;
  # the brush makes it an input itself
  output$swPlot1 <- renderPlot({
    ggplot(starwars_chars, aes(birth_year, name)) +
      geom_point(size=5)
  })
  
  # the second plot uses the selectedData subset to add some red points on top of the black
  # note: when you use a reactive object, you have to include () after the name 
  # (e.g., "selectedData()")
  output$swPlot2 <- renderPlot({
    ggplot(starwars_chars, aes(height,mass)) +
      geom_point(size=5) + 
      geom_point(data=selectedData(), aes(height,mass), color="red", size=5) +
      scale_x_continuous(limits=c(min(starwars_chars$height),(max(starwars_chars$height)))) +
      scale_y_continuous(limits=c(min(starwars_chars$mass),(max(starwars_chars$mass))))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
