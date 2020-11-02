library(shinythemes)
library(shinyWidgets)
library(shiny)
library(shinydashboard)
library(recipes)
#data(mtcars)

data <- read.csv("als_2.csv")

AttributeChoices=c("av_av_bor","av_av_conc","av_av_conf","av_av_frust","n_prob","stu_mean","n_asn")


# Define UI for application
fluidPage(
  navbarPage("R Shiny Dashboard",
             
             
             tabPanel("Regression",
                      tabname="regression",
                      icon=icon("calculator"),
                      selectInput(inputId = "indep", label = "How well do these variables predict score?", 
                                  multiple = TRUE, choices = as.list(AttributeChoices), selected = AttributeChoices[1]),
                      verbatimTextOutput(outputId = "RegOut")
                      
             )
  ))


