
# This is the server logic for a Shiny web application for the Coursera Data Products Course.
# The data set used is included in this code


library(shiny)
library(dplyr)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R

## create data frame of students and test scores
        collegeID <- c(rep("0100",times=10), rep("0200", times=10), rep("0300", times=10))
        studentID <- (1:30)
        testID <- c(rep("1", times = 30)) 
        testScore <- c(80,50,55,70,60,79,87,61,63,40,86,80,76,73,59,78,71,61,79,78,63,77,78,79,59,83,87,85,63,95)
        testDF <-data.frame(collegeID, studentID, testID, testScore)

    mx <- mean(testScore)
    ps <-  input$ps
    
## draw histogram  and add vertical lines for the mean and the user selected passing cut-off grade
    hist(testScore, breaks = 7, col = 'blue', border = 'white')
    abline(v = mx, col = 'purple', lwd = 3)
    text(x = mx, y = 12, "Mean", col = 'purple', lwd = 3 )
    
    abline(v = ps, col = 'green', lwd = 3)
    text(x = ps, y = 12, "Passing", col = 'green', lwd = 3 )
    
 
    
  })
  
## create a table and see if it changes 
  collegeID <- c(rep("0100",times=10), rep("0200", times=10), rep("0300", times=10))
  studentID <- (1:30)
  testID <- c(rep("1", times = 30)) 
  testScore <- c(80,50,55,70,60,79,87,61,63,40,86,80,76,73,59,78,71,61,79,78,63,77,78,79,59,83,87,85,63,95)
  testDF <-data.frame(collegeID, studentID, testID, testScore)
    output$psTable <- renderTable({
          testDF  <-  testDF %>%   mutate(testLabel = testScore > input$ps )  
          Table <-  as.data.frame(table(testDF$testLabel))
          names(Table) <- c('Passed', 'Count')
          return(Table)             }#, caption = "Students Counted by Pass/Fail"
          ) 

## Calculate the % pass     
## below is not changing based on user selection on my PC 
## unless I re-mutate - there must be a better way 
    
## Nothing is displayed on shinyapps.io unless I repeat the entire dataset    
   


output$PercentPassed <- renderText({
        collegeID <- c(rep("0100",times=10), rep("0200", times=10), rep("0300", times=10))
        studentID <- (1:30)
        testID <- c(rep("1", times = 30)) 
        testScore <- c(80,50,55,70,60,79,87,61,63,40,86,80,76,73,59,78,71,61,79,78,63,77,78,79,59,83,87,85,63,95)
        testDF <-data.frame(collegeID, studentID, testID, testScore)
        testDF  <-  testDF %>%   mutate(testLabel = testScore > input$ps )  
        PercentPassed <- round((nrow(subset(testDF, testLabel == TRUE)) / nrow(testDF)),2) * 100
        return(PercentPassed)             }
)



})
