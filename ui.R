library(shiny)

ui <- fluidPage(
  # App title
  titlePanel("Explore the Iris Dataset"),
  
  # Sidebar layout
  sidebarLayout(
    sidebarPanel(
      # Dropdown menu to select variables
      selectInput(
        inputId = "xvar",
        label = "Choose X-axis variable:",
        choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
        selected = "Sepal.Length"
      ),
      selectInput(
        inputId = "yvar",
        label = "Choose Y-axis variable:",
        choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
        selected = "Petal.Length"
      ),
      
      # Slider to filter Sepal Length
      sliderInput(
        inputId = "sepalFilter",
        label = "Filter by Sepal Length:",
        min = min(iris$Sepal.Length),
        max = max(iris$Sepal.Length),
        value = range(iris$Sepal.Length)
      ),
      
      # Radio buttons to select species
      radioButtons(
        inputId = "speciesFilter",
        label = "Filter by Species:",
        choices = c("All", levels(iris$Species)),
        selected = "All"
      )
    ),
    
    mainPanel(
      # Output plot
      plotOutput(outputId = "scatterPlot"),
      
      # Output summary
      verbatimTextOutput(outputId = "summary")
    )
  )
)
