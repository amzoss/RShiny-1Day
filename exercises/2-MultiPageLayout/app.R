#
# Exercise 2: Multi-Page Layout
#

library(shiny)

# Define UI for application that draws a histogram
ui <- navbarPage(
  
  title = "Exercise 2: Multi-Page Layout",
  
  tabPanel(
    title="Page 1: Sidebar",
    sidebarPanel(
      "This text appears in the sidebar."
    ),
    mainPanel(
      "This text appears in the main panel."
    )
  ),
  
  tabPanel(
    title="Page 2: Tabset",
    tabsetPanel(
      tabPanel(
        title="This is the first tab in the tabset panel.",
        "This is content for the first tab in the tabset panel."
      ),
      tabPanel(
        title="This is the second tab in the tabset panel.",
        "This is content for the second tab in the tabset panel."
      )
    )
  ),
  
  tabPanel(
    title="Page 3: Navlist",
    navlistPanel(
      tabPanel(
        title="This is the first tab in the navlist panel.",
        "This is content for the first tab in the navlist panel."
      ),
      tabPanel(
        title="This is the second tab in the navlist panel.",
        "This is content for the second tab in the navlist panel."
      )
    )
  ),
  
  tabPanel(
    title="Page 4: Additional Panels",
    titlePanel("This is a title panel. It should be used as the main heading of the page."),
    absolutePanel("This is an absolute panel. The position is specified absolutely.", left="500px", top="200px"),
    conditionalPanel(TRUE,"This is a conditional panel. You could have it appear based on a condition."),
    fixedPanel("This is a fixed panel. It is like an absolute panel but doesn't scroll.", left="500px", top="400px"),
    flowLayout(inputPanel("This is an input panel. It is meant to be included in a flowLayout().")),
    wellPanel("This is a well panel. It has a grey background.")
  )
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
}

# Run the application 
shinyApp(ui = ui, server = server)
