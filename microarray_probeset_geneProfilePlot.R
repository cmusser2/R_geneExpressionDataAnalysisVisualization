# XY Scatterplot of SLE vs. healthy control samples
# Crystal Musser (crystal.musser2013@gmail.com)
# 
# This algorithm compares transcript profiles from GEO data set  
# peripheral B lymphocytes between patients with systemic lupus 
# erythematosus (SLE) and normal healthy controls in an XY scatterplot.  
#
## README:
## 1) set working directory, if necessary    #setwd("/Users/crystalmusser/Documents/Rhome")
## 2) run R program on .txt input file
## 3) Gene profile plots will be generated in a new window
##
# The GEO summary of the data set is as follows:
# Systemic lupus erythematosus (SLE) is an autoimmune disease with an 
# important clinical and biological heterogeneity. B lymphocytes appear 
# central to the development of SLE which is characterized by the production 
# of a large variety of autoantibodies and hypergammaglobulinemia. In mice, 
# immature B cells from spontaneous lupus prone animals are able to produce 
# autoantibodies when transferred into immunodeficient mice, strongly 
# suggesting the existence of intrinsic B cell defects during lupus. In order 
# to approach these defects in humans, we compared the peripheral B cell 
# transcriptomes of quiescent lupus patients to normal B cell transcriptomes.
#
# RESULTS:
# Gene profile plot of IGLJ3 (immunoglobulin lambda joining 3) at probeset 
# ID 211881_x_at - sample indices across the x-axis and microarray intensity 
# across the y-axis.

sleData <- read.table("sle_b_cell.txt", sep = "\t", header = T, row.names = 1)
testVector <- c(1:26); testVector
gene_IGLJ3 <- sleData["211881_x_at",]; gene_IGLJ3
plot(range(1:26), range(as.numeric(gene_IGLJ3)),  
     type = "n", 
     main = "Gene Profile Plot: IGLJ3 (immunoglobulin lambda joining 3)", 
     xlab = "Sample Indices", ylab = "Intensity")
lines(testVector, as.numeric(gene_IGLJ3))
grid(nx = 26, ny = 26, col = "lightgray")

stacked_gene <- stack(gene_IGLJ3); stacked_gene

sleData <- read.table("sle_b_cell.txt", sep = "\t", header = T, row.names = 1)
gene_IGLJ3 <- sleData["211881_x_at",]; gene_IGLJ3
f <- c(rep("SLE",17),rep("Control",9)); f
with(gene_IGLJ3,{
  bp <- boxplot(as.numeric(gene_IGLJ3) ~ f,
                main = "Single Distribution Boxplot: IGLJ3",
                xlab = "Sample Group", ylab = "Intensity")
  stripchart(as.numeric(gene_IGLJ3) ~ f, vertical = TRUE, method = "jitter",
             pch = 19, add = TRUE, col = "pink")
})
