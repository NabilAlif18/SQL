CREATE DATABASE UAS

USE UAS

CREATE TABLE Branch(
	BranchID CHAR (6) PRIMARY KEY,
	BranchAddress VARCHAR(50) NOT NULL ,
	BranchType VARCHAR(50) NOT NULL
	)

CREATE Table Customer(
	CIF CHAR (30) PRIMARY KEY,
	CustomerName VARCHAR(50) NOT NULL,
	CustomerType VARCHAR(50) NOT NULL
	)

CREATE TABLE AccountDetail(
	AccountDetailID CHAR(6) PRIMARY KEY,
	Nisbah CHAR(10) NOT NULL,
	DispAccNumber_Prof INT NOT NULL,
	DispAccNumber_Principal INT NOT NULL,
	[Period] Date NOT NULL,
	TimeDeposit INT NOT NULL,
	ProfitDist INT NOT NULL,
	AutomaticRollOver VARCHAR(10) NOT NULL,
	IslamicContract VARCHAR(50) NOT NULL,
	Zakat VARCHAR(10) NOT NULL
	)

CREATE TABLE Account(
	AccountNumber CHAR(30) PRIMARY KEY ,
	AccountType VARCHAR(50) NOT NULL,
	BranchID CHAR(6)Foreign key references Branch(BranchID),
	Balance INT NOT NULL,
	AccountDetailID CHAR(6)Foreign key references AccountDetail(AccountDetailID),
	CIF CHAR(30) Foreign key references Customer(CIF)
	)


4. 

a.

	SELECT ad.AccountDetailID, Nisbah, DispAccNumber_Prof,DispAccNumber_Principal,[Period],
	TimeDeposit, ProfitDist, AutomaticRollOver, IslamicContract, Zakat
	FROM AccountDetail ad
	JOIN Account ac
	ON ad.AccountDetailID = ac.AccountDetailID
	JOIN Branch br 
	ON ac.BranchID = br.BranchID
	WHERE BranchAddress = 'Surabaya'

b. 
	SELECT cu.CIF, cu.CustomerName
	FROM Customer cu
	JOIN Account ac
	ON cu.CIF = ac.CIF
	GROUP BY cu.CIF, cu.CustomerName
	HAVING (COUNT(ac.AccountNumber)) > 3


5. 

a. 

	SELECT cu.CIF,cu.CustomerName,cu.CustomerType
	FROM Customer cu
	JOIN Account ac
	ON cu.CIF = ac.CIF
	JOIN Branch br
	ON ac.BranchID = br.BranchID,
	( 
	SELECT BranchAddress
	FROM Branch
	WHERE BranchAddress != 'Jakarta'
	)AS sub
	WHERE br.BranchAddress = sub.BranchAddress
	

b. 
	SELECT ac.AccountNumber, ac.AccountDetailID, ac.AccountType, ac.Balance, ac.BranchID, ac.CIF
	FROM Account ac
	JOIN Branch br 
	ON ac.BranchID = br.BranchID,
	(
		SELECT BranchAddress
		FROM Branch
		WHERE BranchAddress = 'Jakarta' 
		OR BranchAddress = ' Tangerang'
	)AS SUB
	WHERE br.BranchAddress = sub.BranchAddress
	