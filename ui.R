library(shiny)

# Define UI for application that draws plot of sin(t)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Plotting A Sin(Bt + C) + D from the plot of Sin(t)"),
  
  # Sidebar with a slider input for the value of Amplitude
  sidebarLayout(
    sidebarPanel(
      h4("USE THE SLIDERS TO MODIFY THE PARAMETERS OF THE PLOT"),
      sliderInput("Amplitude",
                  "Value of A, amplitude of plot:",
                  min = -4,
                  max = 4,
                  value = 1),
      
      sliderInput("Period",
                  "Value of B, coefficient of t, (period T= 2Pi/B):",
                  min = -3,
                  max = 3,
                  value = 1),
      
      sliderInput("Phase",
                  "Value of C, phase shift:",
                  min = -3,
                  max = 3,
                  value = 0),
      
      sliderInput("Shift",
                  "Value of D, vertical shift:",
                  min = -3,
                  max = 3,
                  value = 0)
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      h6("DOCUMENTATION"),
      h6("In this interactive application you can starting with"),
      h6("the plot of the trigonometric function f(x) = Sin(x)"),
      h6("make the plot of g(x) = ASin(Bx + C)+D in a way that"),
      h6("you will learn how the A, B, C and D parameter affect the plot"),
      helpText(a("Click Here  for More Information in the Application Pitch", href="http://rpubs.com/lucianod/148461", target="_blank"))
    )
  )
))


