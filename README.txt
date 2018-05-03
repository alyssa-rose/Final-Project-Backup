# Final-Project-Backup
Topic: Food Analysis
Authors: Sid Hillwig, Alyssa Rose
Date: 05-02-2018

OVERVIEW
The files analyze food data per country using clustering and polynomial fitting, and extrapolates data 
for a specific food type and year range as specified by the user through a GUI

WHERE TO START
Download FoodDataset.xlsx into the folder and run ReadData.m to convert it into a usable struct.
To analyze and interact with the data:
  1.) Clustering:
  
  
  2.) Interpolation/Extrapolation/Graphing
    Run 'specifyGUI.m' and make region, country, food type, and year range selections. It is recommended
    to start extrapolating from year 2014 (since data ends in 2013) and to end year range around 2025 to
    create a better fit.
SCRIPTS
1) specifyGUI.m - gets user input to extrapolate for specific year range, country, and food type. Saves
   graph of extrapolation as a .fig file using 'savefig' and prints out country, food type, & prediction
   using 'fprintf'
    
CALCULATION FUNCTION
1) CorrectPoly.m - finds the correct poly order to use between 1 and 5 based on R^2 value.
2) ExtrapData.m - extrapolates data for inputted year range, food type, and country using Vandermonde 
   matrix math
3) DataFit.m - fits the data to a polynomial using poly order number from CorrectPoly and from Vandermonde
   matrix math.
