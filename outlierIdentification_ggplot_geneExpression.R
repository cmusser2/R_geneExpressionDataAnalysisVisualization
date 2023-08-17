# Outlier anlaysis on microarray dataset using Gene Correlation Plot (Heat Map)
# Crystal Musser (cmusser2@jh.edu)
#Goal: Outlier analysis on Affymetrix microarray data from patient-matched normal 
#      and stage 1/stage 2 clear cell renal cell carcinoma (cRCC) tumors
#      Using ggplot() to visualize a colorized scatter plot of the correlated Affymetrix 
#      gene expression data set.  Bioconductor 3.17 was installed to use the pcaMethod library.
#      Other libraries imported to make this possible include ggplot, ggplot2, reshape.
# Materials:  This data set was curated from is an Affymetrix microarray experiment (HGU133A array)
#             from Gene Expression Omnibus (GEO) with the accession GDS2880.  Before providing insight
#             into the molecular pathogenesis of patient matched normal and stage 1 or stage 2 
#             clear cell renal cell carcinoma (cRCC) tumors, outlier analysis was conducted using 
#             Bioconductor PCA methods and visualized using a correlation plot (heat map).

library(gplots)
library(ggplot2)
library(reshape)
library(pcaMethods)

# Renal cell carcinoma (cRCC) tumor dataset
setwd("/Users/crystalmusser/Documents/Rhome")
data_cRCC <- read.table("renal_cell_carcinoma.txt", sep = "\t", header = T, row.names = 1)
#View(data_cRCC)
annot_cRCC <- read.table("renal_carcinoma_annotation.txt", sep = " ", header = F)
#View(annot_cRCC)

# Relabeling headers with GSM ID and normal/tumor identity
d <- data.frame(data_cRCC)
colnames(d) <- paste(annot_cRCC$V1,annot_cRCC$V9)
#print(d)

#4- Correlation plot (heat map)
d.cor <- cor(d); d.cor
#par(mar=c(5.1, 4.1, 4.1, 2.1))
layout(matrix(c(1,1,1,1,1,1,1,1,2,2), 5, 2, byrow = TRUE))
par(oma=c(5,7,1,1))
x <- colnames(d.cor)
y <- colnames(d.cor)
df <- melt(d.cor)
colnames(df) <- c("x","y","value")
ggplot(df, aes(x,y, fill=value))+
  geom_tile(color="cyan1")+
  scale_x_discrete(guide = guide_axis(angle = 90)) +
  coord_fixed()+
  ggtitle("Correlation plot GDS2880 Affymetrix data")
#identified outliers (part i)
#GSM146798 Normal
#GSM146799 Tumor

