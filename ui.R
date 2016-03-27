#ui.R
shinyUI(fluidPage(
  headerPanel("Modelling fuel efficiency with the mtcars data set"),
  br(),
  sidebarLayout (
    sidebarPanel(
      
      selectInput(inputId = "atype",
                  label = "Analysis Type:",
                  choices = c("Bivariate" = "0", "Multivariate" = "1"),
                  selected = "0"),
      
      conditionalPanel(condition = "input.atype == '0'",
      
          selectInput(inputId = "Regressor",
                  label = "Regressor:",
                  choices = c("No. of cylinders" = "cyl","Displacement" = "disp", "Horsepower"="hp",
                              "Weight"="wt","Quarter sec."="qsec","Engine"="vs",
                              "Ratio"="drat", "Transmission"="am", "Gears"="gear", 
                              "No. of Carburettors" = "carb"),
                  selected = "am")
      ),

      conditionalPanel(condition = "input.atype == '1'",
      selectInput(inputId = "mregressor",
                  label = "Regressors",
                  choices = c("No. of cylinders" = "cyl","Displacement" = "disp", "Horsepower"="hp",
                              "Weight"="wt","Quarter sec."="qsec","Engine"="vs",
                              "Ratio"="drat", "Transmission"="am", "Gears"="gear", 
                              "No. of Carburettors" = "carb"),
                  selected="am",
                  multiple=TRUE)
      ),

    br(),
    br(),
    h4("Resize Graph"), 
    sliderInput(inputId="plot1_Height", label="Height(px)", min=300, max=450, value=400, step = 50 ),
    sliderInput(inputId="plot1_Width", label="Width(px)", min=400, max=600, value=500, step =50)
  ),
  mainPanel(
    plotOutput(outputId = "plot1"),
    br(),
    br(),
    verbatimTextOutput("model")
    )
)
  
))
  
  