--1

SELECT [Maximum price] = MAX(price), [Minimum Price] = MIN(price), [AVERAGE Price] = ROUND(CAST (AVG(price) AS DECIMAL(8,2)), 0)
from MsTreatment

SELECT StaffPosition, LEFT(StaffGender,1), 'Rp. ' + CAST(CAST(AVG(staffsalary) AS DECIMAL (10,2))AS VARCHAR)
FROM  MsStaff
GROUP BY Staffposition,StaffGender

--3

SELECT CONVERT(VARCHAR,TransactionDate, 107), COUNT(*)
FROM HeaderSalonServices
GROUP BY TransactionDate


--4

SELECT UPPER(CustomerGender), COUNT(*)
FROM MsCustomer mc JOIN HeaderSalonServices hs
ON mc.CustomerId = hs.CustomerId
GROUP BY CustomerGender


--5
SELECT TreatmentTypeName, COUNT(*)
FROM MsTreatmentType mtt JOIN MsTreatment mt
on mt.TreatmentTypeId = mtt.TreatmentTypeId
JOIN DetailSalonServices ds ON ds.TreatmentId = mt.TreatmentId
GROUP BY TreatmentTypeName
ORDER BY COUNT(*) DESC


--6
SELECT CONVERT(VARCHAR,TransactionDate,106), 'Rp. ' + CAST(SUM(Price) AS VARCHAR)
FROM HeaderSalonServices hs JOIN DetailSalonServices ds
ON hs.TransactionId = ds.TransactionId
JOIN MsTreatment mt on mt.TreatmentId = ds.TreatmentId
GROUP BY TransactionDate
HAVING SUM (Price) between 1000000 and 5000000

--7
SELECT REPLACE(mtt.TreatmentTypeId, 'TTO','Treeatment type '), TreatmentTypeName, CAST(COUNT(*) AS VARCHAR) + 'Treatments'
FROM MsTreatmentType mtt JOIN MsTreatment mt ON mtt.TreatmentTypeId = mt.TreatmentId
GROUP BY mtt.TreatmentTypeId, TreatmentTypeName
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC


--8

SELECT LEFT(StaffName, CHARINDEX(' ', StaffName)), hs.TransactionId, COUNT(*)
FROM MsStaff ms JOIN HeaderSalonServices hs 
ON hs.StaffId = ms.StaffId
JOIN DetailSalonServices ds on ds.TransactionId = hs.TransactionId
GROUP BY StaffName,hs.TransactionId