# Overview

This is a part of the project focused on analyzing airline passenger satisfaction data. For visualization, the data was manipulated using T-SQL.
Based on the transformed data, a report was created using Power BI.

# Methodology
## Data collection
A CSV file was found from the Data Playground of Maven Analytics
https://mavenanalytics.io/data-playground
- airline_passenger_satisfaction.csv
  The number of records, which are passengers, is 129,880
  Factors of customer satisfaction are following:
  1. s
  2. 
- data_dictionary.csv
  The descriptions of each column are written.
  
## Data processing
Steps
1. Data Import: The CSV file was imported into SQL Server Management Studio 19
2. DB Design: The database structure was designed and normalized
3. Data Cleansing: Against the dimention table, missing values like NULLs and not applicable values were replaced with meaningful values
4. Data Transformation: 
5. Report: The manipulated data was imported into Power BI, and a report was designed and created
6. Analysis: The analysis was conducted based on the report
