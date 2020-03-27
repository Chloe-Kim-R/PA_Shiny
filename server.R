#
 
library(shiny)
library(caret)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      set.seed(2020-03-26)
      d <- diamonds[sample(nrow(diamonds),10000),]
      fit <- lm(price~carat+cut, data=d)
          
    output$Plot1 <- renderPlot({ 
        caratInput <- input$carat
        cutInput <- input$cut
        pred <- predict(fit, newdata =data.frame(carat=caratInput, cut=cutInput))
        plot(y=d$price, x=d$carat, xlab="Carat", ylab="Price(USD)",xlim=c(0,5), ylim=c(0,40000), col=d$cut)
        legend(x=0, y=40000, c("Predicted","Regression line"), col=c("blue","red"), pch=c(18,NA), lty=c(NA,1))
        abline(fit,col="red",lwd=2)
        points(caratInput,pred, col="blue", pch=18, cex=3.5)

        })    
        
    output$pred1 <- renderText({ 
        caratInput <- input$carat
        cutInput <- input$cut
        predict(fit, newdata = data.frame(carat=caratInput, cut=cutInput))
        })

})

