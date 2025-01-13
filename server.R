library(shiny)
library(ggplot2)

server <- function(input, output) {
  # Reactive expression for filtered data
  filteredData <- reactive({
    data <- iris
    if (input$speciesFilter != "All") {
      data <- data[data$Species == input$speciesFilter, ]
    }
    data <- data[data$Sepal.Length >= input$sepalFilter[1] & 
                   data$Sepal.Length <= input$sepalFilter[2], ]
    return(data)
  })
  
  # Generate scatterplot
  output$scatterPlot <- renderPlot({
    ggplot(filteredData(), aes_string(x = input$xvar, y = input$yvar, color = "Species")) +
      geom_point(size = 3, alpha = 0.7) +
      theme_minimal() +
      labs(title = "Scatterplot of Selected Variables", x = input$xvar, y = input$yvar)
  })
  
  # Display summary statistics
  output$summary <- renderPrint({
    summary(filteredData())
  })
}
