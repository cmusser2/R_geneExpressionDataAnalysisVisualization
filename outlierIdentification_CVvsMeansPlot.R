# Outlier anlaysis on microarray dataset using CV vs. Means plot
# Crystal Musser, M.S. in Bioinformatics (crystal.musser2013@gmail.com)
# Johns Hopkins University, AS.410.671 - Gene Expression Data Analysis and Visualization

# Goal: To visualize samples that have an extraordinarily high variance, plotting the 
#       calculated mean (x-axis) vs. the CV (y-axis) yields samples that are distinctly 
#       not in line with the other samples.
# Materials/Methods:  This data set was curated from is an Affymetrix microarray experiment (HGU133A array)
#             from Gene Expression Omnibus (GEO) with the accession GDS2880.  Before providing insight
#             into the molecular pathogenesis of clear cell renal cell carcinoma (cRCC), outlier analysis was conducted using 
#             the ratio of individual mean and CV calculations to show high variance.
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

# Calculation: CV vs. Means plot
d.mean <- apply(log2(d),2,mean)		# calculate mean for each sample
d.sd <- sqrt(apply(log2(d),2,var))		# calculate st.deviation for each sample
d.cv <- d.sd/d.mean			#calculate cv
par(mar=c(5.1, 4.1, 4.1, 2.1))
plot(d.mean,d.cv,main="cRCC Renal Cell Carcinoma vs. Normal\nSample CV vs. Mean",
     xlab="Mean",ylab="CV",col='blue',cex=1.5,type="n")
points(d.mean,d.cv,bg="deeppink2",col=1,pch=21)
text(d.mean,d.cv,label=dimnames(d)[[2]],pos=1,cex=0.4)
#identify outliers (iii): #GSM146798,  #GSM146799