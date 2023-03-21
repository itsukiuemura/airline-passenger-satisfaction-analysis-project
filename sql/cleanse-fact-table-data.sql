-- ********************************************************************
-- Replace NULL with the average of columns
-- ********************************************************************
UPDATE PassengerSatisfaction
SET Arrival_Delay = 15
WHERE Arrival_Delay IS NULL

-- ********************************************************************
-- Replace 0 with the average of columns except for 0
-- ********************************************************************
DECLARE @total INT
SELECT @total=COUNT() FROM PassengerSatisfaction 
SELECT SUM(CASE WHEN Departure_and_Arrival_Time_Convenience = 0 THEN 1 ELSE 0 END)*100.00/@total AS Departure_and_Arrival_Time_Convenience,
SUM(CASE WHEN Ease_of_Online_Booking = 0 THEN 1 ELSE 0 END)*100.00/@total AS Ease_of_Online_Booking, 
SUM(CASE WHEN Check_in_Service = 0 THEN 1 ELSE 0 END)*100.00/@total AS Check_in_Service,
SUM(CASE WHEN Online_Boarding = 0 THEN 1 ELSE 0 END)*100.00/@total AS Online_Boarding, 
SUM(CASE WHEN Gate_Location = 0 THEN 1 ELSE 0 END)*100.00/@total AS Gate_Location,
SUM(CASE WHEN On_board_Service = 0 THEN 1 ELSE 0 END)*100.00/@total AS On_board_Service, 
SUM(CASE WHEN Seat_Comfort = 0 THEN 1 ELSE 0 END)*100.00/@total AS Seat_Comfort,
SUM(CASE WHEN Leg_Room_Service = 0 THEN 1 ELSE 0 END)*100.00/@total AS Leg_Room_Service, 
SUM(CASE WHEN Food_and_Drink = 0 THEN 1 ELSE 0 END)*100.00/@total AS Food_and_Drink,
SUM(CASE WHEN Cleanliness = 0 THEN 1 ELSE 0 END)*100.00/@total AS Cleanliness, 
SUM(CASE WHEN In_flight_Service = 0 THEN 1 ELSE 0 END)*100.00/@total AS In_flight_Service,
SUM(CASE WHEN In_flight_Wifi_Service = 0 THEN 1 ELSE 0 END)*100.00/@total AS In_flight_Wifi_Service, 
SUM(CASE WHEN Baggage_Handling = 0 THEN 1 ELSE 0 END)*100.00/@total AS Baggage_Handling
FROM PassengerSatisfaction

-- Each of the percentages is less than 5%. Thus, replace 0 with the average of the corresponding columns except for 0
-- Departure_and_Arrival_Time_Convenience
WITH tblAvg AS (
SELECT ROUND(AVG(Departure_and_Arrival_Time_Convenience),0,0) AS Average FROM PassengerSatisfaction WHERE Departure_and_Arrival_Time_Convenience >= 1
)
UPDATE PassengerSatisfaction
SET Departure_and_Arrival_Time_Convenience = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Departure_and_Arrival_Time_Convenience = 0
-- Ease_of_Online_Booking
WITH tblAvg AS (
SELECT ROUND(AVG(Ease_of_Online_Booking),0,0) AS Average FROM PassengerSatisfaction WHERE Ease_of_Online_Booking >= 1
)
UPDATE PassengerSatisfaction
SET Ease_of_Online_Booking = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Ease_of_Online_Booking = 0
-- Check_in_Service
WITH tblAvg AS (
SELECT ROUND(AVG(Check_in_Service),0,0) AS Average FROM PassengerSatisfaction WHERE Check_in_Service >= 1
)
UPDATE PassengerSatisfaction
SET Check_in_Service = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Check_in_Service = 0
-- Online_Boarding
WITH tblAvg AS (
SELECT ROUND(AVG(Online_Boarding),0,0) AS Average FROM PassengerSatisfaction WHERE Online_Boarding >= 1
)
UPDATE PassengerSatisfaction
SET Online_Boarding = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Online_Boarding = 0
-- Gate_Location
WITH tblAvg AS (
SELECT ROUND(AVG(Gate_Location),0,0) AS Average FROM PassengerSatisfaction WHERE Gate_Location >= 1
)
UPDATE PassengerSatisfaction
SET Gate_Location = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Gate_Location = 0
-- On_board_Service
WITH tblAvg AS (
SELECT ROUND(AVG(On_board_Service),0,0) AS Average FROM PassengerSatisfaction WHERE On_board_Service >= 1
)
UPDATE PassengerSatisfaction
SET On_board_Service = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE On_board_Service = 0
-- Seat_Comfort
WITH tblAvg AS (
SELECT ROUND(AVG(Seat_Comfort),0,0) AS Average FROM PassengerSatisfaction WHERE Seat_Comfort >= 1
)
UPDATE PassengerSatisfaction
SET Seat_Comfort = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Seat_Comfort = 0
-- Leg_Room_Service
WITH tblAvg AS (
SELECT ROUND(AVG(Leg_Room_Service),0,0) AS Average FROM PassengerSatisfaction WHERE Leg_Room_Service >= 1
)
UPDATE PassengerSatisfaction
SET Leg_Room_Service = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Leg_Room_Service = 0
-- Food_and_Drink
WITH tblAvg AS (
SELECT ROUND(AVG(Food_and_Drink),0,0) AS Average FROM PassengerSatisfaction WHERE Food_and_Drink >= 1
)
UPDATE PassengerSatisfaction
SET Food_and_Drink = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Food_and_Drink = 0
-- Cleanliness
WITH tblAvg AS (
SELECT ROUND(AVG(Cleanliness),0,0) AS Average FROM PassengerSatisfaction WHERE Cleanliness >= 1
)
UPDATE PassengerSatisfaction
SET Cleanliness = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE Cleanliness = 0
-- In_flight_Service
WITH tblAvg AS (
SELECT ROUND(AVG(In_flight_Service),0,0) AS Average FROM PassengerSatisfaction WHERE In_flight_Service >= 1
)
UPDATE PassengerSatisfaction
SET In_flight_Service = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE In_flight_Service = 0
-- In_flight_Wifi_Service
WITH tblAvg AS (
SELECT ROUND(AVG(In_flight_Wifi_Service),0,0) AS Average FROM PassengerSatisfaction WHERE In_flight_Wifi_Service >= 1
)
UPDATE PassengerSatisfaction
SET In_flight_Wifi_Service = (SELECT Average FROM tblAvg)
OUTPUT INSERTED., DELETED.
WHERE In_flight_Wifi_Service = 0