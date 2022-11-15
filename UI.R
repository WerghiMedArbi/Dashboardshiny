library(shiny)
library(shinydashboard)
library(bslib)

shinyUI(
  dashboardPage(skin = "blue",
                dashboardHeader(title = 'BINOMI :)'),
                dashboardSidebar(
                  sidebarMenu(
                    menuItem(" Home", tabName = "input",icon = icon("home")),
                    menuItem(" Configure", tabName = "input",icon = icon("tachometer-alt")),
                    menuSubItem("View input data", tabName = "input",icon = icon("database")),
                    
                    menuItem("Results", tabName = "P"),
                    menuSubItem(" Results Plot", tabName = "P", icon = icon("chart-line")),
                    menuSubItem(" Results Table", tabName = "T", icon = icon("table")),
                    
                    menuItem(" About us", tabName = "about", icon = icon("info")),
                    menuItem(" Ay haja", tabName = "ayhaja", icon = icon("readme"))
                  )
                  
                  
                ),
                dashboardBody(theme = bs_theme(
                  bg = "#101010", 
                  fg = "#FDF7F7", 
                  primary = "#ED79F9", 
                  base_font = font_google("Prompt"),
                  code_font = font_google("JetBrains Mono")),
                  tabItems(
                    # Zero tab content
                    tabItem(tabName = "intro",
                            h2("WELCOME to our Dashboard!
                   "),
                            h3("You can choose whatever you want check from the sidebar")
                            
                    ),
                    
                    # First tab content
                    tabItem(tabName = "input",
                            fluidRow(
                              # box(
                              
                              #radioButtons(inputId="header", label="lena checkbox", 
                              #            choices=c("True" = TRUE,
                              #                     "False" = FALSE), selected = NULL,
                              #          inline = FALSE, width = '80px'),
                              #numericInput(inputId="Ken hajetna b haja feha a3ded", label=" :p ", value=0, min = 0, width = '80px'),
                              
                              # title="Parameters", status="primary", width=12, solidHeader = TRUE, collapsible = TRUE)  # end outer box
                              
                              
                              box(
                                
                                # Define UI for application that draws a histogram
                                
                                
                                checkboxGroupInput("descriptor", "Descriptors:",
                                                   choiceNames=c("Rooms","Electricity","Floors","Water","Toilet","Phone","Radio","Tv","Car","Motorbike","Fridge"), 
                                                   choiceValues = c("hv213","hv206","hv216","hv204","hv205","hv221","hv207","hv208","hv212","hv211","hv209"),
                                                   inline =  TRUE),
                                
                                #selectizeInput("descriptor","select Description",choices = unique(varsjdid$description), multiple=TRUE),
                                selectizeInput("surv","select id",choices =unique(datasets$CountryName) ,multiple= TRUE ),
                                
                                title="Parameters", status="primary", width=12, solidHeader = TRUE, collapsible = TRUE  # end outer box
                                
                                
                                
                              ),
                            ),    #  close fluidrow
                            fluidRow(
                              box(
                                
                                # Show a plot of the generated distribution
                                mainPanel(
                                  dataTableOutput("datasetsData")
                                ), 
                                title="Output", status="primary", , width=12, solidHeader = TRUE,collapsible = TRUE
                              )
                              
                            ),
                          #  fluidRow(
                           #   box(
                            #    h2('Reviews')
                             # )
                            #)
                    ),
                    # Second tab content
                    tabItem(tabName = "P",
                            h2("contenue mt3 resultats P"),
                            
                            box(
                              title = "Controls",
                              sliderInput( "slider", "Number of observations:", 1, 100, 50) #maybe nest7a9ouh
                            ),
                    ),
                    # Third tab content
                    tabItem(tabName = "T",
                            h2("contenue mt3 resultats T")
                    ),
                    # 4th tab content
                    tabItem(tabName = "about",
                            h2("About us"),
                            h3('Good Evening everyone,')
                          
                    ),
                    # 5th tab content
                    tabItem(tabName = "ayhaja",
                            h2("contenue mt3 ay haja")
                    )
                    
                    
                    
                    
                    
                    
                    
                  )  #  end of tabItems
                )
  )
)