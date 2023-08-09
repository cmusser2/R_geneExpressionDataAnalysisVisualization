# Gene Profile Plot using Average Value Imputation

# Crystal Musser
# M.S. in Bioinformatics
# Johns Hopkins University
# Gene Expression Data Analysis and Visualization - Lab 2

# This program generates a gene profile plot of gene YAL002W, a membrane-binding 
# component of the CORVET complex involved in endosomal vesicle tethering of S. cerevisiae. 
# The missing values have been imputed using the row mean.

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

### CALCULATE:Average value imputation ###
dat <- data_Spellman[,23:46] # isolated cdc15 experiments (samples 23-46)
dat.avg <- mean(as.numeric(as.matrix(dat["YAL002W",])), na.rm = T)
dat["YAL002W",is.na(dat["YAL002W",])] <- dat.avg
### OUTPUT ###
plot(as.numeric(dat["YAL002W",]),type='l',lwd=2,col='red', main="Spellman's S. cerevisiae (CDC15 experiment)\ngene YAL002W" ,xlab="Time", ylab="Intensity",axes=F)
axis(1,at=c(1:ncol(dat)),labels=sub("cdc15_","",names(dat)),las=2,cex.axis=0.7)
axis(2)

