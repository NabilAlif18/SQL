--JOIN - INNER & OUTER JOIN



--SET OPERATIONS

DROP TABLE Table1
DROP TABLE Table2

CREATE TABLE Table1 (
	Data1 CHAR
)

CREATE TABLE Table2 (
	Data2 CHAR
)

INSERT INTO Table1 VALUES
('A'),('B'),('C')

INSERT INTO Table2 VALUES
('C'),('D'),('E')

SELECT *
FROM Table1
JOIN Table2
ON Table1.Data1 = Table2.Data2

SELECT *
FROM Table1
LEFT JOIN Table2
ON Table1.Data1 = Table2.Data2

SELECT *
FROM Table1
RIGHT JOIN Table2
ON Table1.Data1 = Table2.Data2

SELECT *
FROM Table1
FULL JOIN Table2
ON Table1.Data1 = Table2.Data2

-- left exclusive (yang bukan irisan)

SELECT *
FROM Table1
LEFT JOIN Table2
ON Table1.Data1 = Table2.Data2
WHERE TABLE2.Data2 IS NULL


--SET OPERATIONS (UNION,INTERSECT, EXCEPT)
--LEFT EXCLUSIVE JOIN
SELECT * 
FROM MsTreatment mt
LEFT JOIN DetailSalonServices dss
ON dss.TreatmentId = mt.TreatmentId
WHERE dss.TreatmentId IS NULL


--gabunginin staff male dengan staff stylist


SELECT ms.StaffId, ms.StaffName, ms.StaffGender, ms.StaffPosition
FROM MsStaff ms
WHERE StaffGender = 'Male'
UNION
SELECT ms.StaffId, ms.StaffName, ms.StaffGender, ms.StaffPosition
FROM MsStaff ms
WHERE StaffPosition = 'Stylist'
AND StaffName NOT LIKE 'indra%'


--intersect


SELECT ms.StaffId, ms.StaffName, ms.StaffGender, ms.StaffPosition
FROM MsStaff ms
WHERE StaffGender = 'Male'
INTERSECT
SELECT ms.StaffId, ms.StaffName, ms.StaffGender, ms.StaffPosition
FROM MsStaff ms
WHERE StaffPosition = 'Stylist'
AND StaffName NOT LIKE 'indra%'

--except

SELECT ms.StaffId, ms.StaffName, ms.StaffGender, ms.StaffPosition
FROM MsStaff ms
WHERE StaffGender = 'Male'
EXCEPT
SELECT ms.StaffId, ms.StaffName, ms.StaffGender, ms.StaffPosition
FROM MsStaff ms
WHERE StaffPosition = 'Stylist'
AND StaffName NOT LIKE 'indra%'


--1

SELECT mtt.TreatmentTypeName, mt.TreatmentName, mt.Price
FROM MsTreatmentType mtt
JOIN MsTreatment mt
ON mtt.TreatmentTypeId = mt.TreatmentTypeId
WHERE (TreatmentTypeName LIKE '%hair%'
OR TreatmentTypeName LIKE 'nail%')
AND PRICE < 100000


--2
SELECT StaffName, 
StaffEmail = LOWER(LEFT(StaffName,1) +  REVERSE(LEFT(REVERSE(StaffName),CHARINDEX(' ',REVERSE(StaffName,1)) - 1)) + 'oosalon.com'
FROM MsStaff ms
JOIN HeaderSalonServices hss



SELECT REVERSE(LEFT(REVERSE('Michson Bryan Lie'),CHARINDEX(' ',REVERSE('Michson Bryan Lie')) - 1))


--3
SELECT
	REPLACE(hss.TransactionId, 'TR','Trans') AS 'New Transaction ID',
	[Old Transaction ID] = hss.TransactionId,
	TransactionDate,
	StaffName,
	CustomerName
FROM HeaderSalonServices hss
JOIN MsStaff ms
ON hss.StaffId = ms.StaffId
JOIN MsCustomer mc
ON mc.CustomerId = hss.CustomerId
WHERE DATEDIFF(DAY, TransactionDate,'2012-12-24') = 2




--8
SELECT 
	[Name] = 'Mr. ' + StaffName,
	StaffPosition,
	StaffSalary
FROM MsStaff
WHERE StaffGender = 'Male'
UNION
SELECT 
	[Name] = 'Ms. ' + StaffName,
	StaffPosition,
	StaffSalary
FROM MsStaff
WHERE StaffGender = 'Female'
ORDER BY NAME, StaffPosition