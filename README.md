# R_geneExpressionDataAnalysisVisualization
# R_missingValueImputation_methods

Learning Goals:
- Demonstrate methods used in imputing missing values:
     -  average value imputation
     -  weighted K-nearest neighbor (KNN)
     -  SVD impute method

Pearson's Correlation Matrix - calculated Pearson's distances will be high when genes vary in a similar way in the two experiments, even if the magnitude of change differs greatly


Materials/Methods:
- Data set: "spellman.txt"
  - The cDNA data set is from Paul Spellman's lab at Stanford, characterizing the yeast Saccharomyces cerevisiae genome.  The data set includes 3 different experiments, each with its own time course (each array is a different time point) for measuring transcript levels that are induced by various cyclins.  The transcripts that respond to this stimulus are seen to be regulated at the different stages of the cell cycle.  The 3 experiments differ by the method that the yeast cultures were synchronized: α factor arrest, elutriation, and arrest of a cdc15 temperature-sensitive mutant. 
