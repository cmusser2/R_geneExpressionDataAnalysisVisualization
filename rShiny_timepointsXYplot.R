# Interactive R-Shiny application plotting timepoints against each other

# Crystal Musser
# M.S. in Bioinformatics
# Johns Hopkins University
# Gene Expression Data Analysis and Visualization - Lab 2

# This program plots Spellman's isolated CDC15 data matrix from the cDNA data set
# in an interactive manner that allows the user to choose the X and Y variables as 
# well as datapoint color.

# The cDNA data set is from Paul Spellman's lab at Stanford, characterizing the 
#yeast Saccharomyces cerevisiae genome.  The data set includes 3 different 
#experiments, each with its own time course (each array is a different time point) 
#for measuring transcript levels that are induced by various cyclins.  
#The transcripts that respond to this stimulus are seen to be regulated at the 
#different stages of the cell cycle.  The 3 experiments differ by the method that 
#the yeast cultures were synchronized: α factor arrest, elutriation, and arrest 
#of a cdc15 temperature-sensitive mutant.  The cdc15 time course experiment is 
#the one that we will use in this lab to conduct some simple mathematical manipulations and plots.

# Spellman, P. T., Sherlock, G., et al (1998). Comprehensive identification of 
#cell cycle–regulated genes of the yeast Saccharomyces cerevisiae by microarray 
# hybridization. Molecular biology of the cell, 9(12), 3273-3297. 

### INPUT ###
#install.packages("gplots")
setwd("/Users/crystalmusser/Documents/Rhome")
data_Spellman <- read.table("spellman.txt", sep = "\t", header = T, row.names = 1)
#View(data_Spellman)
library(shiny)

### CALCULATE:###
server <- function(input, output) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    dat[, c(input$xcol, input$ycol)]
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(), col=1, bg = input$colx, pch = 21, cex = 0.5)
  })
}

ui <- 	fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput('xcol', 'X Variable', dimnames(dat)[[2]]),
      selectInput('ycol', 'Y Variable', dimnames(dat)[[2]],
                  selected=dimnames(dat)[[2]][1]),
      selectInput('colx', 'Point color', c("red","blue","green","black","orange"))	
    ),
    mainPanel(
      plotOutput('plot1')
    )
  )
)

### OUTPUT ###
shinyApp(ui=ui,server=server)

