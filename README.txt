# Final-Project-Backup
Topic: Food Analysis
Authors: Sid Hillwig, Alyssa Rose
Date: 05-03-2018

OVERVIEW
The files analyze food data per country using clustering and polynomial fitting, and extrapolates data 
for a specific food type and year range as specified by the user through a GUI. Information of clusters provided
in the form of 3D cluster plots and cluster-specific histograms and tables.

WHERE TO START
Download FoodDataset.xlsx into the folder and run ReadData.m to convert it into a usable struct.
To analyze and interact with the data:
  1.) Clustering:
    Run 'RunFoodForThought.m' and enter choice of diet (Carbohydrate-Protein-Lipid (CPL) or Beverages (Bev)) and choice of cluster (1 
    through 7). Program takes a while to run because of 3D cluster plotting which will be performed so user can visually understand 
    clusterings.
  
  2.) Interpolation/Extrapolation/Graphing
    Run 'specifyGUI.m' and make region, country, food type, and year range selections. It is recommended to start extrapolating from     
    year 2014 (since data ends in 2013) and to end year range around 2025 to create a better fit.
SCRIPTS
1) ReadData.m - reads in 'FoodDataset.xlsx' from excel and forms structure "area" through a constructor function
2) specifyGUI.m - gets user input to extrapolate for specific year range, country, and food type. Saves graph of extrapolation as a .fig
   file using 'savefig' and prints out country, food type, & prediction using 'fprintf'
3) RunFoodForThought.m - creates 3D cluster plot and prompts user for input of diet choice and cluster choice to provide cluster
   specific histogram, quartile information, and table of area names
4) ClusterDiets.m - script called in 'RunFoodForThought.m' which groups data to specified diet, performs clustering algorithm and plots
   the 3D clusters for CPL and Bev diets.
    
CALCULATION FUNCTION
1) CorrectPoly.m - finds the correct poly order to use between 1 and 5 based on R^2 value.
2) ExtrapData.m - extrapolates data for inputted year range, food type, and country using Vandermonde matrix math
3) DataFit.m - fits the data to a polynomial using poly order number from CorrectPoly and from Vandermonde matrix math.
4) ComputeDistance.m - computes Euclidean distance of a datapoint to its cluster center for use in KmeansCore.m
5) GetSummedDistances.m - computes sum of distances of datapoints to their cluster centers for use in KmeansCore.m
6) CreateGroups.m - calculates data for specific groups within a diet (i.e. Carbohydrates, proteins, lipids)
   
SUPPORT FUNCTIONS
1) plot3m - projects point onto map
2) Plot3DClusters.m - code based on Elad Kivelevitch (MathWorks File Exchange,"PlotClusters(Data,IDX,Centers,Colors)") which iteratively plots points with specific colors for each cluster for all years and areas.

TESTS
1) [yPredic, xPredic, yFit,coeff,condNum,rSq]=DataFit(1992:2013,area(4).legumes,0,2020:2022)
        yPredic = [442.3330,449.2463,456.3346]      
        coeff:   1.0e+05 * [0.0000 , -0.0035, 3.4349]
        polyOrder = 2
   
                  
                  
