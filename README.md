# Overview
This is a part of the project focused on analyzing airline passenger satisfaction data. For visualization, the data was manipulated using T-SQL.
Based on the transformed data, a report was created using Power BI.

# Methodology
### Steps
1. **Data Collection**<br>
&nbsp;CSV files containing airline passenger satification scores were found from the Data Playground of [Maven Analytics](https://mavenanalytics.io/data-playground).
&nbsp;- **airline_passenger_satisfaction.csv**<br>
&nbsp;&nbsp;The number of records, which are passengers, is 129,880.
&nbsp;&nbsp;Factors of customer satisfaction are following:
&nbsp;&nbsp;1. Flight Distance
&nbsp;&nbsp;2. Departure Delay
&nbsp;&nbsp;3. Arrival Delay
&nbsp;&nbsp;4. Departure and Arrival Time Convenience
&nbsp;&nbsp;5. Ease of Online Booking
&nbsp;&nbsp;6. Check-in Service
&nbsp;&nbsp;7. Online Boarding
&nbsp;&nbsp;8. Gate Location
&nbsp;&nbsp;9. On-board Service
&nbsp;&nbsp;10. Seat Comfort
&nbsp;&nbsp;11. Leg Room Service
&nbsp;&nbsp;12. Cleanliness
&nbsp;&nbsp;13. Food and Drink
&nbsp;&nbsp;14. In-flight Service
&nbsp;&nbsp;15. In-flight Wifi Service
&nbsp;&nbsp;16. In-flight Entertainment
&nbsp;&nbsp;17. Baggage Handling
&nbsp;- **data_dictionary.csv**<br>
&nbsp;&nbsp;The descriptions of each column are written.
&nbsp;The file **airline_passenger_satisfaction.csv** was imported into SQL Server Management Studio 19 for data transformation.
2. **Database Design**<br>
&nbsp;The database structure was designed and normalized.
&nbsp;Please refer to **create-dimension-tables.sql**.
4. **Data Cleansing**<br>
&nbsp;Against the dimention table, missing values like NULLs and not applicable values were replaced with meaningful values.
&nbsp;Please refer to **cleanse-fact-table-data.sql**.
6. **Data Transformation**<br>
&nbsp;To display radar charts, fact tables were created from the original table.
&nbsp;Please refer to **create-dimension-tables-for-radar-charts.sql**
8. **Report**<br>
&nbsp;The manipulated data was imported into Power BI, and a report was designed and created.
9. **Analysis**<br>
&nbsp;The analysis was conducted based on the report.
