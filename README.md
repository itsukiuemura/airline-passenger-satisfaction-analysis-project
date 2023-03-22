# Overview
This is a part of the project focused on analyzing airline passenger satisfaction data. For visualization, the data was manipulated using T-SQL.
Based on the transformed data, a report was created using Power BI.

# Methodology
### Steps
1. **Data Collection**<br>
Two CSV files containing airline passenger satification scores were obtained from the Data Playground of [Maven Analytics](https://mavenanalytics.io/data-playground).
- **airline_passenger_satisfaction.csv**<br>
The file contains 129,880 records, each representing a passenger.<br>
- **data_dictionary.csv**<br>
The file provides descriptions of each column.
The file **airline_passenger_satisfaction.csv** was then imported into SQL Server Management Studio 19 for data transformation.
2. **Database Design**<br>
A database structure was designed and normalized based on the data collected.
Please refer to **create-dimension-tables.sql** script for details.
4. **Data Cleansing**<br>
The data was cleansed by replacing missing values, such as NULLs and not applicable values, with meaningful values.
Please refer to **cleanse-fact-table-data.sql** script for details.
6. **Data Transformation**<br>
TFact tables were created from the original table to display radar charts.
Please refer to **create-dimension-tables-for-radar-charts.sql** script for details.
8. **Report**<br>
The transformed data was imported into Power BI, and a report was designed and created to provide a visual presentation of the data.
9. **Analysis**<br>
The analysis was conducted based on the report to gain insights into the airline passenger satisfaction scores.
