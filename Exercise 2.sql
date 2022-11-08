USE CakeShop

--NO 1
DROP TABLE PastryChef
CREATE TABLE PastryChef(
	PastryChefID CHAR (10) PRIMARY KEY CHECK (PastryCHefID LIKE 'PC[0-9][0-9][0-9]'),
	PastryChefNamem VARCHAR(50) NOT NULL,
	PastryChefEmail VARCHAR(50) NOT NULL CHECK((PastryChefEMail LIKE '%@yahoo.com') or (PastryChefEMail LIKE '%@gmail.com')),
	PastryChefSalary INT NOT NULL
	)

SELECT * FROM PastryChef

ALTER TABLE STAFF
ADD Staffphone VARCHAR (15)

ALTER TABLE STAFF
ADD CONSTRAINT check_Staff_Phone CHECK (Staffphone LIKE '%+44')

SELECT * FROM Staff

--3 
SELECT * FROM Customer
INSERT INTO Customer VALUES ('IA011','Emma watson','Gryfindor street no 6','02123123753','1990-04-15','female')


--masukin tanggal yyyy-mm-dd

--4

SELECT * FROM CAKE
WHERE LEN(CakeName) > 13


--5
SELECT * FROM Staff
BEGIN TRAN 
UPDATE Staff
SET StaffSalary += 1100000
FROM Staff s, HeaderTransaction ht,Customer c
WHERE s.StaffID = ht.StaffID AND c.CustomerID = ht.CustomerID AND c.CustomerID = 'IA001'

SELECT * FROM Staff




ROLLBACK

