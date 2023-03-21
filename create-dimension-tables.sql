-- ********************************************************************
-- Create master tables
-- ********************************************************************
CREATE TABLE dbo.CustomerType
(
	ID INT CONSTRAINT PK_CustomerType PRIMARY KEY IDENTITY(1,1),
	Customer_Type VARCHAR(10) NOT NULL,
	CONSTRAINT unqCustomerType UNIQUE (Customer_Type)
)


CREATE TABLE dbo.TypeOfTravel
(
	ID INT CONSTRAINT PK_TypeOfTravel PRIMARY KEY IDENTITY(1,1),
	Type_Of_Travel VARCHAR(20) NOT NULL,
	CONSTRAINT unqTypeOfTravel UNIQUE (Type_Of_Travel)
)

CREATE TABLE dbo.Class
(
	ID INT CONSTRAINT PK_Class PRIMARY KEY IDENTITY(1,1),
	Class VARCHAR(20) NOT NULL,
	CONSTRAINT unqClass UNIQUE (Class)
)

CREATE TABLE dbo.Satisfaction
(
	ID INT CONSTRAINT PK_Satisfaction PRIMARY KEY IDENTITY(1,1),
	Satisfaction VARCHAR(30) NOT NULL,
	CONSTRAINT unqSatisfaction UNIQUE (Satisfaction)
)

CREATE TABLE dbo.Gender
(
	ID INT CONSTRAINT PK_Gender PRIMARY KEY IDENTITY(1,1),
	Gender VARCHAR(10) NOT NULL,
	CONSTRAINT unqGender UNIQUE (ID, Gender)
)

-- ********************************************************************
-- Populate data into tables
-- ********************************************************************
INSERT INTO dbo.CustomerType
SELECT DISTINCT Customer_Type FROM dbo.PassengerSatisfaction

INSERT INTO dbo.TypeOfTravel
SELECT DISTINCT Type_of_Travel FROM dbo.PassengerSatisfaction

INSERT INTO dbo.Class
SELECT DISTINCT Class FROM dbo.PassengerSatisfaction

INSERT INTO dbo.Satisfaction
SELECT DISTINCT Satisfaction FROM dbo.PassengerSatisfaction

INSERT INTO dbo.Gender
SELECT DISTINCT Gender FROM dbo.PassengerSatisfaction

-- ********************************************************************
-- Create foreign keys
-- ********************************************************************
 UPDATE PassengerSatisfaction
SET PassengerSatisfaction.Customer_Type = CustomerType.ID
FROM CustomerType
WHERE PassengerSatisfaction.Customer_Type = CustomerType.Customer_Type

UPDATE PassengerSatisfaction
SET PassengerSatisfaction.Type_of_Travel = TypeOfTravel.ID
FROM TypeOfTravel
WHERE PassengerSatisfaction.Type_of_Travel = TypeOfTravel.Type_Of_Travel

UPDATE PassengerSatisfaction
SET PassengerSatisfaction.Class = Class.ID
FROM Class
WHERE PassengerSatisfaction.Class = Class.Class

UPDATE PassengerSatisfaction
SET PassengerSatisfaction.Satisfaction = Satisfaction.ID
FROM Satisfaction
WHERE PassengerSatisfaction.Satisfaction = Satisfaction.Satisfaction

UPDATE PassengerSatisfaction
SET PassengerSatisfaction.Gender = Gender.ID
FROM Gender
WHERE PassengerSatisfaction.Gender = Gender.Gender

ALTER TABLE PassengerSatisfaction ALTER COLUMN Customer_Type INT NULL
ALTER TABLE PassengerSatisfaction ALTER COLUMN Type_of_Travel INT NULL
ALTER TABLE PassengerSatisfaction ALTER COLUMN Class INT NULL
ALTER TABLE PassengerSatisfaction ALTER COLUMN Satisfaction INT NULL
ALTER TABLE PassengerSatisfaction ALTER COLUMN Gender INT NULL

ALTER TABLE PassengerSatisfaction
ADD CONSTRAINT FK_CustomerType_ID FOREIGN KEY (Customer_Type) REFERENCES CustomerType(ID),
CONSTRAINT FK_TypeOfTravel_ID FOREIGN KEY (Type_of_Travel) REFERENCES TypeOfTravel(ID),
CONSTRAINT FK_Class_ID FOREIGN KEY (Class) REFERENCES Class(ID),
CONSTRAINT FK_Satisfaction_ID FOREIGN KEY (Satisfaction) REFERENCES Satisfaction(ID),
CONSTRAINT FK_Gender_ID FOREIGN KEY (Gender) REFERENCES Gender(ID)