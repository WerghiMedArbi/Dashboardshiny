library(shiny)
library(shinydashboard)
library(DT)
library(rlang)

library("stringr")                                 # Load stringr package
#install.packages("stringr")                        # Install stringr package


shinyServr <- function(input, output) {
  
  
  output$datasetsData <- renderDataTable({ 
    if (is.null(input$surv) && is.null(input$descriptor)){
      cat("\nlkolferghin ◑﹏◐\n")
      #countryFilter <-final_of_alljdid[1:200,]
    }
    cat("\n------------------------------------------------\nchriguibaw: \n",unique(varsyesl7o$variable) %in% input$descriptor,"\t",input$descriptor,"\nCountry:",unique(datasets$CountryName) %in% input$surv,"\t",(input$surv),"\n---------------------\n")
    if (is.null(input$surv) ){
      #countryFilter <- subset(Q ,indexOf( Q$description ,input$descriptor) >0  )
      countryFilter <- subset(final_of_final_of_final , varsjdid$survey_id == final_of_alljdid$SurveyId & unique(varsyesl7o$variable) %in% input$descriptor) #is.na(str_locate(pattern= Q$description,input$descriptor)[1])!=FALSE
    }
    else if (is.null(input$descriptor)){
      countryFilter <- subset(final_of_final_of_final ,unique( final_of_alljdid$SurveyId)==unique(datasets$SurveyId) & unique(datasets$CountryName) %in% input$surv )
    }
    else {
      countryFilter <- subset(final_of_final_of_final ,unique( final_of_alljdid$SurveyId)==unique(datasets$SurveyId) &unique(datasets$CountryName) %in% input$surv & unique(varsyesl7o$survey_id) ==unique( final_of_alljdid$SurveyId) & unique(varsyesl7o$variable) %in% input$descriptor)
    }
  },extensions = 'Buttons', options = list(dom = 'Bfrtip' ,buttons = list('copy', 'pdf', 'CSV', 'excel', 'print'))) 
}
