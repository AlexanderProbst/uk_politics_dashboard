# Minimal Shiny stub
if (!requireNamespace("shiny", quietly = TRUE)) install.packages("shiny")
library(shiny)

ui <- fluidPage(
  titlePanel("UK Politics Dashboard (Shiny)"),
  sidebarLayout(
    sidebarPanel("Filters go here"),
    mainPanel("Plots/tables go here")
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
