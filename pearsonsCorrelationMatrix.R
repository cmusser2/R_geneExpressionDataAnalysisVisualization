# Crystal Musser
# M.S. in Bioinformatics
# Johns Hopkins University
# Gene Expression Data Analysis and Visualization - Lab 2

# This program generates a Pearson's correlation coefficient matrix between timepoint covariances of the
# Pearsons correlation between all columns. The "pairwise.complete.obs" function fills in missing values with 
# the covariance between each variable pair for all complete pairs of observations on those variables.

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
library(gplots)

### CALCULATE:Pearson's correlation matrix ###
dat <- data_Spellman[,23:46] # isolated cdc15 experiments (samples 23-46)
dat.Pcor <- cor(dat, use = 'pairwise.complete.obs')

### OUTPUT ###
layout(matrix(c(1,1,1,1,1,1,1,1,2,2), 5, 2, byrow = TRUE))
par(oma=c(5,7,1,1))
colorScheme <- rev(colorpanel(25,"red","white","blue"))
leg <- seq(min(dat.Pcor,na.rm=T),max(dat.Pcor,na.rm=T),length=10)
image(dat.Pcor,main="Pearson's correlation matrix\nCDC15 experiment",axes=F,col=colorScheme)
axis(1,at=seq(0,1,length=ncol(dat.Pcor)),label=dimnames(dat.Pcor)[[2]],cex.axis=0.9,las=2)
axis(2,at=seq(0,1,length=ncol(dat.Pcor)),label=dimnames(dat.Pcor)[[2]],cex.axis=0.9,las=2)

