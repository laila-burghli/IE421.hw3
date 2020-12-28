library(shiny)
mpgData<- mtcars
ui <- fluidPage(
  titlePanel(h2("Miles Per Gallon")),
  
  sidebarLayout( 
    sidebarPanel(
      selectInput("variable", label = h4("Variable:"), 
                  choices = list("Cylinders" = "cyl",
                                 "Transmission" = "am",
                                 "Gears" = "gear"),
                  selected = 1)
    ),
    
    mainPanel(
      plotOutput("distPlot")
      
    ))
)

server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({ 
    
    
    qplot(mpg, data = mpgData, geom= "histogram", 
          main = paste("mpg ~", input$variable), 
          binwidth = 5, xlab=input$variable, ylab = "count",
          fill = I("deepskyblue3"), colour= I('white'), 
          facets = input$variable)
    
  }) 
}
shinyApp(ui = ui, server = server)
