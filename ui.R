
# This is the server logic for a Shiny web application for the Coursera Data Products Course.
# The data set used is included in the server.R
# The application displays a histogram of student grades, allows the user to determine the passing grade
# then updates the abline on the graph and changes the # and % passing
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("What is the % Pass when the Passing Grade Changed?"),

  
  
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
                h4('The green bar will move based on your input'),
                plotOutput("distPlot"),
                
                h4('Students Counted by Pass/Fail'),
                tableOutput("psTable"),
                br(),

                
                
## maked sure they are changing correctly
##                h4('Total Students Tested'),
##                textOutput("TotalTested"),
##                br(),
                
##                h4('# Students Passed'),
##                textOutput("Passed"),
##                br(),
                
                h4('% Students Passed'),
                textOutput("PercentPassed")
                
                
                )
     )  
  )
)