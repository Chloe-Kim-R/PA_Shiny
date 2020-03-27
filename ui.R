
library(shiny)

# Define UI for application 
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict the Price of Diamonds"),
    
    # Input for carat and cut
    sidebarLayout(
        sidebarPanel(
            h3("Let's predict price!"),
            h4("Input carat and cut quality below"),
            sliderInput("carat", h3("How many carats? :"),0.2,5.0,value = 0.1),
            radioButtons("cut", h3("Select Cutting Grade"),
                          choices = list ("Fair" = "Fair", 
                                          "Good" = "Good", 
                                          "Very Good" = "Very Good",
                                          "premium"="Premium",
                                          "Ideal"="Ideal")),
            submitButton("Submit")
                         ), 
        mainPanel(
            plotOutput("Plot1"),
            h4("Predicted Price (in USD):"),
            tags$style("#pred1 {font-size:15px; color:red;}"),
            textOutput("pred1")
         )
       )
    ))