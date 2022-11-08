--Nabil Alif
--240034800
--NO 1

BEGIN TRAN
CREATE TABLE MedicineType(
	MedicineTypeID CHAR (5) PRIMARY KEY CHECK (MedicineTypeID LIKE 'MT[0-9][0-9][0-9]'),
	MedicineTypeName VARCHAR(20) NOT NULL CHECK((MedicineTypeName LIKE 'Generic') or (MedicineTypeName LIKE 'Potent')),
	MedicineTypeDescription VARCHAR(50) NOT NULL CHECK((MedicineTypeDescription LIKE 'Need%') or (MedicineTypeDescription LIKE 'No Need%'))
	)

SELECT * FROM MedicineType
COMMIT

--NO 2
BEGIN TRAN
ALTER TABLE Pharmacist
ADD PharmacistEmail VARCHAR (50)

SELECT * FROM Pharmacist
COMMIT

ALTER TABLE Pharmacist
ADD CONSTRAINT check_Pharmacist_Email CHECK (CHARINDEX('@',	PharmacistEmail) > 0 AND (PharmacistEmail LIKE '%.com'))

--NO 3

BEGIN TRAN
INSERT INTO Branch VALUES ('BC007', 'EStrong BSD Pharmacy', 'Danau Golf Street 5', 'Loenardoe','081733587893')

SELECT * FROM Branch
COMMIT


--NO 4


SELECT PharmacistName, PharmacistGender, PharmacistDOB, PharmacistPhone  FROM Pharmacist
WHERE LEN(PharmacistName) < 13



--NO 5

BEGIN TRAN
DELETE Cs
FROM Customer Cs, TransactionHeader Th
WHERE Cs.CustomerID = Th.CustomerID
AND DATEPART(MONTH, th.TransactionDate) = 1

COMMIT

SELECT * FROM Customer