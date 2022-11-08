--1 

CREATE VIEW [BranchOwnership]
AS
SELECT BranchName,BranchOwner,BranchPhone
FROM Branch
WHERE BranchOwner LIKE '% %'


SELECT * FROM BranchOwnership



--2 

SELECT CustomerName,CustomerGender,CustomerPhone,CustomerAddress
FROM Customer cu
WHERE cu.CustomerID IN(
SELECT th.CustomerID
FROM TransactionHeader th
WHERE DATENAME(MONTH, th.TransactionDate) = 'December')


--3.

SELECT cu.CustomerID, [CustomerName] = 'Mr. ' + CustomerName,
CustomerEmail, [TransactionCount] = COUNT(th.TransactionID)
FROM Customer cu
JOIN TransactionHeader th
ON cu.CustomerID = th.CustomerID
WHERE DATENAME(YEAR, cu.CustomerDOB) < '2000'
GROUP BY Cu.CustomerID, CustomerName,CustomerEmail
UNION
SELECT cu.CustomerID, [CustomerName] = 'Mr. ' + CustomerName,
CustomerEmail, [TransactionCount] = COUNT(th.TransactionID)
FROM Customer cu
JOIN TransactionHeader th
ON cu.CustomerID = th.CustomerID
WHERE DATENAME(DAY, th.TransactionDate) = 'Tuesday'
GROUP BY Cu.CustomerID, CustomerName,CustomerEmail


--4

SELECT th.TransactionID, [TransactionDate] = CONVERT(VARCHAR, TransactionDate,107),
[TotalSales] ='Rp.' + CAST(SUM(me.MedicinePrice)AS VARCHAR)
FROM TransactionHeader th 
JOIN TransactionDetail td
ON th.TransactionID = td.TransactionID
JOIN Medicine me
ON td.MedicineID = me.MedicineID
WHERE DATENAME(MONTH, th.TransactionDate) = 'February' or DATENAME(MONTH, th.TransactionDate) = 'July'
GROUP BY th.TransactionID, th.TransactionDate

--5

	SELECT [LastName] = RIGHT(ph.PharmacistName, CHARINDEX(' ', REVERSE(ph.PharmacistName))-1),
	[TotalTransaction] = COUNT(th.TransactionID),[salary] = 'Rp. ' + CAST (ph.PharmacistSalary AS VARCHAR) 
	FROM Pharmacist ph
	JOIN TransactionHeader th
	ON ph.PharmacistID = th.PharmacistID
	WHERE ph.Pharmacistgender = 'Male' 
	GROUP BY PharmacistName,PharmacistSalary


(
	SELECT [PharmacistSalary] = AVG(ph.PharmacistSalary) 
	FROM Pharmacist ph
) AS sub
WHERE ph.PharmacistID = sub.PharmacistID

