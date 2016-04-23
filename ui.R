
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library("shiny")
library("shinydashboard")
library("highcharter")
library("quantmod")
library("forecast")


dashboardPage(
      skin = "black",
      dashboardHeader(title = "Currency Data Analysis", disable = FALSE),
      dashboardSidebar(
            sidebarMenu(
                  selectInput("type1", label = "Select a currency ", width = "100%",
                              choices = c("USD - US Dollar" = "USD",  "GBP - British Pound" ="GBP", "INR - Indian Rupee" = "INR", "AUD - Australian Dollar"= "AUD", "CNY - Chinese Yuan Renminbi" = "CNY")), 
                  #selectInput("type2", label = "To Currency Type", width = "100%",
                  #            choices = c("EUR - Euro" = "EUR","USD - US Dollar" = "USD", "GBP - British Pound" ="GBP", "INR - Indian Rupee" = "INR", "AUD - Australian Dollar"= "AUD", "CNY - Chinese Yuan Renminbi" = "CNY")), 
                  dateRangeInput("daterange", "Date range:",
                                 start = "2016-01-01",
                                 end   = "2016-04-11"),
                  
                  tagList(tags$h4("How to - Documentation:"),
                          tags$li("1. Select a currency"),
                          tags$li("2. change the dates to what you want"),
                          tags$li("3. The application will update"),
                          tags$li("5. Hover on the chart for more details"),
                          tags$li("4. Analyse the result"),
                          tags$li("6. Use the slider at the bottom of"),
                          tags$li("... the chart to change the data"),
                          tags$li("7. You can also use the date fields at"),
                          tags$li("... the top of the chart to change the "),
                          tags$li("... data date range")
                          )
                  
                  
            )
      ),
      dashboardBody(
            tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/custom_fixs.css")),
            
            box(width = 12, highchartOutput("highohlc")),
            box(width = 12,  
                h3("Quantitative Analysis of Foreign Exchange Rates"), br(),
                p("The foreign exchange market (forex, FX, or currency market) is a global decentralized market for the trading of currencies. This includes all aspects of buying, selling and exchanging currencies at current or determined prices. In terms of volume of trading, it is by far the largest market in the world.[1] The main participants in this market are the larger international banks. Financial centres around the world function as anchors of trading between a wide range of multiple types of buyers and sellers around the clock, with the exception of weekends. The foreign exchange market does not determine the relative values of different currencies, but sets the current market price of the value of one currency as demanded against another."), 
                p("The foreign exchange market works through financial institutions, and it operates on several levels. Behind the scenes banks turn to a smaller number of financial firms known as “dealers,” who are actively involved in large quantities of foreign exchange trading. Most foreign exchange dealers are banks, so this behind-the-scenes market is sometimes called the “interbank market”, although a few insurance companies and other kinds of financial firms are involved. Trades between foreign exchange dealers can be very large, involving hundreds of millions of dollars. Because of the sovereignty issue when involving two currencies, forex has little (if any) supervisory entity regulating its actions."), 
                p("The foreign exchange market assists international trade and investments by enabling currency conversion. For example, it permits a business in the United States to import goods from European Union member states, especially Eurozone members, and pay Euros, even though its income is in United States dollars. It also supports direct speculation and evaluation relative to the value of currencies, and the carry trade, speculation based on the interest rate differential between two currencies.[2]Conversely, there is a widespread contrary opinion[3] on speculation: individuals must avoid speculative activities as the social and legal endorsement does not exempt from individual responsibility to follow moral principles."),
                p("In a typical foreign exchange transaction, a party purchases some quantity of one currency by paying with some quantity of another currency. The modern foreign exchange market began forming during the 1970s after three decades of government restrictions on foreign exchange transactions (the Bretton Woods system of monetary management established the rules for commercial and financial relations among the world's major industrial states after World War II), when countries gradually switched to floating exchange rates from the previous exchange rate regime, which remained fixed as per the Bretton Woods system. (From Wikipedia)"), br()
                
                #textOutput("text1"), br(), textOutput("text2"),br(),
                #textOutput("text3")
                )
            
      )
)


