
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R

    # create data frame
        collegeID <- c(rep("0100",times=10), rep("0200", times=10), rep("0300", times=10))
        studentID <- (1:30)
        testID <- c(rep("1", times = 30)) 
        testScore <- c(80, 50, 55, 70, 60, 79, 87, 61, 63, 40, 86,80,76,73,59,78,71,61, 79,78,63,77,78,79,59,83,87,85,63,95)
        testLabel <- c("Pass","Fail","Fail","Pass","Fail","Pass","Pass","Fail ","Fail","Fail"
                        ,"Pass","Pass","Pass","Pass","Fail","Pass","Pass","Fail","Pass","Pass"
                        ,"Fail","Pass","Pass","Pass","Fail","Pass","Pass","Pass","Fail","Pass")
         
        testDF <-data.frame(collegeID, studentID, testID, testScore, testLabel )
        
    mx <- mean(testScore)
    ps <- input$ps


    # draw the histogram with the specified number of bins
    hist(testScore, breaks = 7, col = 'blue', border = 'white')
    abline(v = mx, col = 'purple', lwd = 2)
    abline(v = ps, col = 'green', lwd = 2)

    
    
    
  })

})
