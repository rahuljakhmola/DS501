library(shinythemes)
library(shinyWidgets)
library(shiny)
library(shinydashboard)
library(recipes)

data <- read.csv("als_2.csv")

# Define server logic 
function(input, output) {
  
  #-------------------REGRESSION-------------------#
  
  recipe_formula <- reactive(data %>%
                               recipe() %>%
                               update_role(perc_score,new_role = "outcome") %>%
                               update_role(!!!input$indep,new_role = "predictor") %>% 
                               formula())
  
  lm_reg <- reactive(
    lm(recipe_formula(),data = data)
  )
  
  
  output$RegOut = renderPrint({summary(lm_reg())})
  
}

