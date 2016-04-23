
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

function(input, output) {
      
      
      
      currency <- reactive({
            #getSymbols(paste0( input$type1,'/', input$type2), from = input$daterange[1],
             #          to = input$daterange[2], auto.assign = FALSE)
            
            getSymbols(input$type1, from = input$daterange[1],
                       to = input$daterange[2], auto.assign = FALSE)
      })
      
      output$text1 <- renderText({ 
            "
            The foreign exchange market (forex, FX, or currency market) is a global decentralized market for the trading of currencies. This includes all aspects of buying, selling and exchanging currencies at current or determined prices. In terms of volume of trading, it is by far the largest market in the world.[1] The main participants in this market are the larger international banks. Financial centres around the world function as anchors of trading between a wide range of multiple types of buyers and sellers around the clock, with the exception of weekends. The foreign exchange market does not determine the relative values of different currencies, but sets the current market price of the value of one currency as demanded against another.
            "

                  })
      
      output$text2 <- renderText({ 
            "
            The foreign exchange market works through financial institutions, and it operates on several levels. Behind the scenes banks turn to a smaller number of financial firms known as “dealers,” who are actively involved in large quantities of foreign exchange trading. Most foreign exchange dealers are banks, so this behind-the-scenes market is sometimes called the “interbank market”, although a few insurance companies and other kinds of financial firms are involved. Trades between foreign exchange dealers can be very large, involving hundreds of millions of dollars. Because of the sovereignty issue when involving two currencies, forex has little (if any) supervisory entity regulating its actions.
            "
      })
      
      
      output$text3 <- renderText({ 
            "
            The foreign exchange market assists international trade and investments by enabling currency conversion. For example, it permits a business in the United States to import goods from European Union member states, especially Eurozone members, and pay Euros, even though its income is in United States dollars. It also supports direct speculation and evaluation relative to the value of currencies, and the carry trade, speculation based on the interest rate differential between two currencies.[2]Conversely, there is a widespread contrary opinion[3] on speculation: individuals must avoid speculative activities as the social and legal endorsement does not exempt from individual responsibility to follow moral principles            
            "
      })
      
      chartSerie3 <- function(){
            hchart(currency()) 
      }
      
      output$highohlc <- renderHighchart({
            
            chartSerie3() %>%
                  hc_title(text = paste0( "Currency fluctuation :", input$type1) )
            
      })
      
}
