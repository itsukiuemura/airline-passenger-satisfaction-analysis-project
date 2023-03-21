# Overview
This is a part of the project focused on analyzing airline passenger satisfaction data. For visualization, the data was manipulated using T-SQL.
Based on the transformed data, a report was created using Power BI.

# Methodology
### Steps
1. **Data Collection**<br>
Two CSV files containing airline passenger satification scores were found from the Data Playground of [Maven Analytics](https://mavenanalytics.io/data-playground).
- **airline_passenger_satisfaction.csv**<br>
The number of records, which are passengers, is 129,880.<br>
- **data_dictionary.csv**<br>
The descriptions of each column are written.
The file **airline_passenger_satisfaction.csv** was imported into SQL Server Management Studio 19 for data transformation.
2. **Database Design**<br>
The database structure was designed and normalized.
Please refer to **create-dimension-tables.sql**.
4. **Data Cleansing**<br>
Against the dimention table, missing values like NULLs and not applicable values were replaced with meaningful values.
Please refer to **cleanse-fact-table-data.sql**.
6. **Data Transformation**<br>
To display radar charts, fact tables were created from the original table.
Please refer to **create-dimension-tables-for-radar-charts.sql**
8. **Report**<br>
The manipulated data was imported into Power BI, and a report was designed and created.
9. **Analysis**<br>
The analysis was conducted based on the report.
