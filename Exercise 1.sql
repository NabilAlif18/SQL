--latihan soal tanggal 9

 --soal 1
 SELECT * FROM MsStaff

 SELECT MsStaff.StaffId, StaffName, StaffPosition, TransactionDate, PaymentType
 FROM MsStaff , HeaderSalonServices 
 WHERE MsStaff.StaffId = HeaderSalonServices.StaffId

 BEGIN TRAN 

 -Transaction date jatuh ditanggal 24


 -- berdasarkan tanggal
 DELETE ms
 FROM MsStaff ms, HeaderSalonServices hss
 WHERE ms.StaffId = hss.StaffId
 AND DATEPART(DAY, hss.TransactionDate) = 22


 DELETE 
 FROM MsStaff WHERE StaffId = 'SF006'


 SELECT * FROM MsStaff

 INSERT INTO MsStaff VALUES
 ('SF006','Jeklin Harefa', 'Female', '085265433322', 'Kebon Jeruk Street no 140', 3000000, 'Stylist'),
 ('SF007','Lavinia', 'Female', '085755500011', 'Kebon Jeruk Street no 153', 3000000, 'Stylist')
 

ROLLBACK
COMMIT


--soal 2

INSERT INTO HeaderSalonServices VALUES
('TR019', 'CU005', 'SF004', DATEADD(DAY,3,GETDATE()), 'Credit')

SELECT * FROM HeaderSalonServices

SELECT DATEADD(DAY,3,GETDATE())

--Soal 3
--Rumus : Rand() * (max-min) + min
RAND()* 2000000 + 3000000

INSERT INTO MsStaff VALUES
('SF010',' Effendy Lesmana', 'Male', '085218587878', 'Tanggerang City Street no 88',ROUND(RAND()* 2000000 + 3000000,0), 'Stylist')

SELECT * FROM MsStaff

--soal 4
BEGIN TRAN
UPDATE MsCustomer
SET CustomerPhone = REPLACE(CustomerPhone,'08','628')

SELECT * FROM MsCustomer

COMMIT

-ASCENDING

SELECT * FROM MsStaff
ORDER BY StaffName ASC

-- descending tinggal diubah ASC menjadi DEC