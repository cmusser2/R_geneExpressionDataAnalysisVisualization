# R_geneExpressionDataAnalysisVisualization
# R_missingValueImputation_methods

Software:

Bioconductor must be installed to access the pcaMethods.  See for more info: 
https://www.bioconductor.org/packages/release/bioc/html/pcaMethods.html 

############################################
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("pcaMethods")
#############################################

Learning Goals:

- Demonstrate methods used in imputing missing values:
     -  average value imputation
     -  weighted K-nearest neighbor (KNN)
     -  SVD impute method

Calculations: 

Pearson's Correlation Matrix - calculated Pearson's distances will be high when genes vary in a similar way in the two experiments, even if the magnitude of change differs greatly


Data sets: 

"spellman.txt"
- The cDNA data set is from Paul Spellman's lab at Stanford, characterizing the yeast Saccharomyces cerevisiae genome.  The data set includes 3 different experiments, each with its own time course (each array is a different time point) for measuring transcript levels that are induced by various cyclins.  The transcripts that respond to this stimulus are seen to be regulated at the different stages of the cell cycle.  The 3 experiments differ by the method that the yeast cultures were synchronized: α factor arrest, elutriation, and arrest of a cdc15 temperature-sensitive mutant. 

"renal_carcinoma_annotation.txt"
- Affymetrix microarray experiment (HGU133A array from Gene Expression Omnibus (GEO) with the accession GDS2880 from patient-matched normal and stage 1/stage 2 clear cell renal cell carcinoma (cRCC) tumors.


