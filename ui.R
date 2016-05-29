
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Test Data"),

  
  
  # Sidebar with a slider input for number of bins
 sidebarLayout(
    sidebarPanel(
            numericInput('ps'
                         , 'Minimum passing score'
                         , 60, min = 0, max = 100
                         )
),
 # Show a plot of the generated distribution
    mainPanel(
                h4(' The passing score is in green and the median is in purple'),
                plotOutput("distPlot")
                )
     )  
  )
)