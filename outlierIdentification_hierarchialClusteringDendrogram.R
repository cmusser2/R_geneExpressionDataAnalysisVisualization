# Outlier anlaysis on microarray dataset using Hierarchial Clustering Dendrogram
# Crystal Musser, M.S. in Bioinformatics (crystal.musser2013@gmail.com)
# Johns Hopkins University, AS.410.671 - Gene Expression Data Analysis and Visualization

# Goal: Outlier analysis on Affymetrix microarray data from patient-matched normal 
#      and stage 1/stage 2 clear cell renal cell carcinoma (cRCC) tumors
#      Using ggplot() to visualize a colorized scatter plot of the correlated Affymetrix 
#      gene expression data set. 
# Materials/Methods:  This data set was curated from is an Affymetrix microarray experiment (HGU133A array)
#             from Gene Expression Omnibus (GEO) with the accession GDS2880.  Before providing insight
#             into the molecular pathogenesis of clear cell renal cell carcinoma (cRCC), outlier analysis was conducted using 
#             Euclidean distance calculations and visualized using a Hierarchical Clustering Dendrogram.
# Results: There are 2 clear outlier samples: “GSM146798 Normal” and “GSM146799 Tumor”

library(gplots)
library(ggplot2)
library(reshape)
library(pcaMethods)

# Import Renal cell carcinoma (cRCC) tumor dataset
setwd("/Users/crystalmusser/Documents/Rhome")
data_cRCC <- read.table("renal_cell_carcinoma.txt", sep = "\t", header = T, row.names = 1)
#View(data_cRCC)
annot_cRCC <- read.table("renal_carcinoma_annotation.txt", sep = " ", header = F)
#View(annot_cRCC)

# Relabeling headers with GSM ID and normal/tumor identity
d <- data.frame(data_cRCC)
colnames(d) <- paste(annot_cRCC$V1,annot_cRCC$V9)
#print(d)

#4 Hierarchial clustering dendrogram
dat <- t(d)			#transpose d
dat.dist <- dist(dat,method="euclidean")	# calculate distance
dat.clust <- hclust(dat.dist,method="single")	# calculate clusters
par(mar=c(5.1, 4.1, 4.1, 2.1))
plot(dat.clust,labels=names(dat),cex=0.75)	# plot cluster tree
#identified outliers: GSM146798 Normal, GSM146799 Tumor
