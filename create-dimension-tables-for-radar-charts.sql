-- ********************************************************************
-- Factors by Gender
-- ********************************************************************
WITH tblTable AS (
	SELECT 
		AVG(CAST(Ease_of_Online_Booking AS DECIMAL(9,8))) AS Ease_of_Online_Booking, 
		AVG(CAST(Check_in_Service AS DECIMAL(9,8))) AS Check_in_Service, 
		AVG(CAST(Departure_and_Arrival_Time_Convenience AS DECIMAL(9,8))) AS Departure_and_Arrival_Time_Convenience,
		AVG(CAST(Online_Boarding AS DECIMAL(9,8))) AS Online_Boarding,
		AVG(CAST(Gate_Location AS DECIMAL(9,8))) AS Gate_Location,
		AVG(CAST(On_board_Service AS DECIMAL(9,8))) AS On_board_Service,
		AVG(CAST(Seat_Comfort AS DECIMAL(9,8))) AS Seat_Comfort,
		AVG(CAST(Leg_Room_Service AS DECIMAL(9,8))) AS Leg_Room_Service,
		AVG(CAST(Cleanliness AS DECIMAL(9,8))) AS Cleanliness,
		AVG(CAST(Food_and_Drink AS DECIMAL(9,8))) AS Food_and_Drink,
		AVG(CAST(In_flight_Service AS DECIMAL(9,8))) AS In_flight_Service,
		AVG(CAST(In_flight_Wifi_Service AS DECIMAL(9,8))) AS In_flight_Wifi_Service,
		AVG(CAST(In_flight_Entertainment AS DECIMAL(9,8))) AS In_flight_Entertainment,
		AVG(CAST(Baggage_Handling AS DECIMAL(9,8))) AS Baggage_Handling,
		AVG(CAST(Satisfaction AS DECIMAL(9,8))) AS Satisfaction,
		b.Gender
	FROM PassengerSatisfaction AS a
	INNER JOIN Gender AS b
	ON a.Gender = b.ID
	GROUP BY b.Gender
)
SELECT Factors, [Male], [Female], ABS([Male]-[Female]) AS Difference
INTO FactorByGender
FROM
(
	SELECT Factors, SatisfactionLevel, Gender
	FROM tblTable
	UNPIVOT (SatisfactionLevel FOR Factors IN (
	[Departure_and_Arrival_Time_Convenience]
    ,[Ease_of_Online_Booking]
    ,[Check_in_Service]
    ,[Online_Boarding]
    ,[Gate_Location]
    ,[On_board_Service]
    ,[Seat_Comfort]
    ,[Leg_Room_Service]
    ,[Cleanliness]
    ,[Food_and_Drink]
    ,[In_flight_Service]
    ,[In_flight_Wifi_Service]
    ,[In_flight_Entertainment]
    ,[Baggage_Handling])) AS unpvt
) AS c
PIVOT (AVG(SatisfactionLevel) FOR Gender IN ([Male],[Female])) AS pvt

-- ********************************************************************
-- Factors by Customer Type
-- ********************************************************************
WITH tblTable AS (
	SELECT 
		AVG(CAST(Ease_of_Online_Booking AS DECIMAL(9,8))) AS Ease_of_Online_Booking, 
		AVG(CAST(Check_in_Service AS DECIMAL(9,8))) AS Check_in_Service, 
		AVG(CAST(Departure_and_Arrival_Time_Convenience AS DECIMAL(9,8))) AS Departure_and_Arrival_Time_Convenience,
		AVG(CAST(Online_Boarding AS DECIMAL(9,8))) AS Online_Boarding,
		AVG(CAST(Gate_Location AS DECIMAL(9,8))) AS Gate_Location,
		AVG(CAST(On_board_Service AS DECIMAL(9,8))) AS On_board_Service,
		AVG(CAST(Seat_Comfort AS DECIMAL(9,8))) AS Seat_Comfort,
		AVG(CAST(Leg_Room_Service AS DECIMAL(9,8))) AS Leg_Room_Service,
		AVG(CAST(Cleanliness AS DECIMAL(9,8))) AS Cleanliness,
		AVG(CAST(Food_and_Drink AS DECIMAL(9,8))) AS Food_and_Drink,
		AVG(CAST(In_flight_Service AS DECIMAL(9,8))) AS In_flight_Service,
		AVG(CAST(In_flight_Wifi_Service AS DECIMAL(9,8))) AS In_flight_Wifi_Service,
		AVG(CAST(In_flight_Entertainment AS DECIMAL(9,8))) AS In_flight_Entertainment,
		AVG(CAST(Baggage_Handling AS DECIMAL(9,8))) AS Baggage_Handling,
		AVG(CAST(Satisfaction AS DECIMAL(9,8))) AS Satisfaction,
		b.Customer_Type
	FROM PassengerSatisfaction AS a
	INNER JOIN CustomerType AS b
	ON a.Customer_Type = b.ID
	GROUP BY b.Customer_Type
)
SELECT Factors, [First-time], [Returning], ABS([First-time]-[Returning]) AS Difference
INTO FactorByCustomerType
FROM
(
	SELECT Factors, SatisfactionLevel, Customer_Type
	FROM tblTable
	UNPIVOT (SatisfactionLevel FOR Factors IN (
	[Departure_and_Arrival_Time_Convenience]
    ,[Ease_of_Online_Booking]
    ,[Check_in_Service]
    ,[Online_Boarding]
    ,[Gate_Location]
    ,[On_board_Service]
    ,[Seat_Comfort]
    ,[Leg_Room_Service]
    ,[Cleanliness]
    ,[Food_and_Drink]
    ,[In_flight_Service]
    ,[In_flight_Wifi_Service]
    ,[In_flight_Entertainment]
    ,[Baggage_Handling])) AS unpvt
) AS c
PIVOT (AVG(SatisfactionLevel) FOR Customer_Type IN ([First-time], [Returning])) AS pvt

-- ********************************************************************
-- Factors by Class
-- ********************************************************************
WITH tblTable AS (
	SELECT 
		AVG(CAST(Ease_of_Online_Booking AS DECIMAL(9,8))) AS Ease_of_Online_Booking, 
		AVG(CAST(Check_in_Service AS DECIMAL(9,8))) AS Check_in_Service, 
		AVG(CAST(Departure_and_Arrival_Time_Convenience AS DECIMAL(9,8))) AS Departure_and_Arrival_Time_Convenience,
		AVG(CAST(Online_Boarding AS DECIMAL(9,8))) AS Online_Boarding,
		AVG(CAST(Gate_Location AS DECIMAL(9,8))) AS Gate_Location,
		AVG(CAST(On_board_Service AS DECIMAL(9,8))) AS On_board_Service,
		AVG(CAST(Seat_Comfort AS DECIMAL(9,8))) AS Seat_Comfort,
		AVG(CAST(Leg_Room_Service AS DECIMAL(9,8))) AS Leg_Room_Service,
		AVG(CAST(Cleanliness AS DECIMAL(9,8))) AS Cleanliness,
		AVG(CAST(Food_and_Drink AS DECIMAL(9,8))) AS Food_and_Drink,
		AVG(CAST(In_flight_Service AS DECIMAL(9,8))) AS In_flight_Service,
		AVG(CAST(In_flight_Wifi_Service AS DECIMAL(9,8))) AS In_flight_Wifi_Service,
		AVG(CAST(In_flight_Entertainment AS DECIMAL(9,8))) AS In_flight_Entertainment,
		AVG(CAST(Baggage_Handling AS DECIMAL(9,8))) AS Baggage_Handling,
		AVG(CAST(Satisfaction AS DECIMAL(9,8))) AS Satisfaction,
		b.Class
	FROM PassengerSatisfaction AS a
	INNER JOIN Class AS b
	ON a.Class = b.ID
	GROUP BY b.Class
)
SELECT Factors, [Economy], [Economy Plus], [Business]
INTO FactorByClass
FROM
(
	SELECT Factors, SatisfactionLevel, Class
	FROM tblTable
	UNPIVOT (SatisfactionLevel FOR Factors IN (
	[Departure_and_Arrival_Time_Convenience]
    ,[Ease_of_Online_Booking]
    ,[Check_in_Service]
    ,[Online_Boarding]
    ,[Gate_Location]
    ,[On_board_Service]
    ,[Seat_Comfort]
    ,[Leg_Room_Service]
    ,[Cleanliness]
    ,[Food_and_Drink]
    ,[In_flight_Service]
    ,[In_flight_Wifi_Service]
    ,[In_flight_Entertainment]
    ,[Baggage_Handling])) AS unpvt
) AS c
PIVOT (AVG(SatisfactionLevel) FOR Class IN ([Economy], [Economy Plus], [Business])) AS pvt

-- ********************************************************************
-- Factors by Type of Travel
-- ********************************************************************
WITH tblTable AS (
	SELECT 
		AVG(CAST(Ease_of_Online_Booking AS DECIMAL(9,8))) AS Ease_of_Online_Booking, 
		AVG(CAST(Check_in_Service AS DECIMAL(9,8))) AS Check_in_Service, 
		AVG(CAST(Departure_and_Arrival_Time_Convenience AS DECIMAL(9,8))) AS Departure_and_Arrival_Time_Convenience,
		AVG(CAST(Online_Boarding AS DECIMAL(9,8))) AS Online_Boarding,
		AVG(CAST(Gate_Location AS DECIMAL(9,8))) AS Gate_Location,
		AVG(CAST(On_board_Service AS DECIMAL(9,8))) AS On_board_Service,
		AVG(CAST(Seat_Comfort AS DECIMAL(9,8))) AS Seat_Comfort,
		AVG(CAST(Leg_Room_Service AS DECIMAL(9,8))) AS Leg_Room_Service,
		AVG(CAST(Cleanliness AS DECIMAL(9,8))) AS Cleanliness,
		AVG(CAST(Food_and_Drink AS DECIMAL(9,8))) AS Food_and_Drink,
		AVG(CAST(In_flight_Service AS DECIMAL(9,8))) AS In_flight_Service,
		AVG(CAST(In_flight_Wifi_Service AS DECIMAL(9,8))) AS In_flight_Wifi_Service,
		AVG(CAST(In_flight_Entertainment AS DECIMAL(9,8))) AS In_flight_Entertainment,
		AVG(CAST(Baggage_Handling AS DECIMAL(9,8))) AS Baggage_Handling,
		AVG(CAST(Satisfaction AS DECIMAL(9,8))) AS Satisfaction,
		b.Type_of_Travel
	FROM PassengerSatisfaction AS a
	INNER JOIN TypeOfTravel AS b
	ON a.Type_of_Travel = b.ID
	GROUP BY b.Type_Of_Travel
)
SELECT Factors, [Business], [Personal], ABS([Business]-[Personal]) AS Difference
INTO FactorByTypeOfTravel
FROM
(
	SELECT Factors, SatisfactionLevel, Type_Of_Travel
	FROM tblTable
	UNPIVOT (SatisfactionLevel FOR Factors IN (
	[Departure_and_Arrival_Time_Convenience]
    ,[Ease_of_Online_Booking]
    ,[Check_in_Service]
    ,[Online_Boarding]
    ,[Gate_Location]
    ,[On_board_Service]
    ,[Seat_Comfort]
    ,[Leg_Room_Service]
    ,[Cleanliness]
    ,[Food_and_Drink]
    ,[In_flight_Service]
    ,[In_flight_Wifi_Service]
    ,[In_flight_Entertainment]
    ,[Baggage_Handling])) AS unpvt
) AS c
PIVOT (AVG(SatisfactionLevel) FOR Type_of_Travel IN ([Business], [Personal])) AS pvt

-- ********************************************************************
-- Factors by Age
-- ********************************************************************
WITH tblTable AS (
SELECT
AVG(CAST(Ease_of_Online_Booking AS DECIMAL(9,8))) AS Ease_of_Online_Booking,
AVG(CAST(Check_in_Service AS DECIMAL(9,8))) AS Check_in_Service,
AVG(CAST(Departure_and_Arrival_Time_Convenience AS DECIMAL(9,8))) AS Departure_and_Arrival_Time_Convenience,
AVG(CAST(Online_Boarding AS DECIMAL(9,8))) AS Online_Boarding,
AVG(CAST(Gate_Location AS DECIMAL(9,8))) AS Gate_Location,
AVG(CAST(On_board_Service AS DECIMAL(9,8))) AS On_board_Service,
AVG(CAST(Seat_Comfort AS DECIMAL(9,8))) AS Seat_Comfort,
AVG(CAST(Leg_Room_Service AS DECIMAL(9,8))) AS Leg_Room_Service,
AVG(CAST(Cleanliness AS DECIMAL(9,8))) AS Cleanliness,
AVG(CAST(Food_and_Drink AS DECIMAL(9,8))) AS Food_and_Drink,
AVG(CAST(In_flight_Service AS DECIMAL(9,8))) AS In_flight_Service,
AVG(CAST(In_flight_Wifi_Service AS DECIMAL(9,8))) AS In_flight_Wifi_Service,
AVG(CAST(In_flight_Entertainment AS DECIMAL(9,8))) AS In_flight_Entertainment,
AVG(CAST(Baggage_Handling AS DECIMAL(9,8))) AS Baggage_Handling,
AVG(CAST(Satisfaction AS DECIMAL(9,8))) AS Satisfaction,
ROUND(Age,-1, 1) AS AgeGroup
FROM PassengerSatisfaction
GROUP BY ROUND(Age,-1, 1)
)
SELECT Factors, [0], [10], [20], [30], [40], [50], [60], [70], [80]
INTO FactorByAge
FROM
(
SELECT Factors, SatisfactionLevel, AgeGroup
FROM tblTable
UNPIVOT (SatisfactionLevel FOR Factors IN (
[Departure_and_Arrival_Time_Convenience]
,[Ease_of_Online_Booking]
,[Check_in_Service]
,[Online_Boarding]
,[Gate_Location]
,[On_board_Service]
,[Seat_Comfort]
,[Leg_Room_Service]
,[Cleanliness]
,[Food_and_Drink]
,[In_flight_Service]
,[In_flight_Wifi_Service]
,[In_flight_Entertainment]
,[Baggage_Handling])) AS unpvt
) AS c
PIVOT (AVG(SatisfactionLevel) FOR AgeGroup IN ([0], [10], [20], [30], [40], [50], [60], [70], [80])) AS pvt