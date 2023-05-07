--1    2501959384    Steven Ong
--2    2501970342    Farrellino Athar Nasution
--3    2502025845    Muhammad Rizky Maulana
--4    2502003011    Andre Budiman

--1
SELECT
CarBrandCountry,
'Times Rent' = COUNT(*)
FROM CarBrand CB
JOIN Car C ON CB.CarBrandID = C.CarBrandID
JOIN TransactionRental TR ON C.CarID = TR.CarID
WHERE DATEPART(quarter, StartRentalDate) = 2
GROUP BY CarBrandCountry

--2
SELECT
m.MechanicID,
MechanicName,
[EMAIL] =  REPLACE(MechanicEmail, 'mail.com', 'mecha.com'),
'Total Earning' = 'IDR ' + CAST(SUM(CarServicePrice) AS varchar)
FROM Mechanic M
JOIN TransactionService TS ON M.MechanicID = TS.MechanicID
JOIN CarService CS ON TS.CarServiceID = CS.CarServiceID
WHERE CarServicePrice > 300000
GROUP BY m.MechanicID, MechanicName, [MechanicEmail]
HAVING SUM(CarServicePrice) > 3000000

--3
SELECT TOP(5)
TransactionRentalID,
[Total Distance] = SUM(CarDistance)
FROM TransactionRental
WHERE YEAR(StartRentalDate) = 2022
GROUP BY TransactionRentalID
ORDER BY [Total Distance] DESC

--4
SELECT
C.CarID,
CONCAT(CarBrandName,'.',CarName) AS [Car],
CONCAT(SUBSTRING(CarBrandCountry, 1, 1),SUBSTRING(CarBrandCountry, LEN(CarBrandCountry), 1)) AS [Country Code],
CarEngineCapacity,
[Time Rent] = COUNT(*)
FROM Car C
JOIN CarBrand CB ON C.CarBrandID = CB.CarBrandID
JOIN TransactionRental TR ON C.CarID = TR.CarID
WHERE CarEngineCapacity > (
	SELECT
	AVG(CarEngineCapacity)
	FROM Car
)GROUP BY CarEngineCapacity, C.CarID, CarBrandName, CarName, CarBrandCountry

--5
SELECT DISTINCT
CarServiceName,
[Old Price] = CarServicePrice,
[New Price] = CAST((CarServicePrice + 0.05  * CarServicePrice ) AS int)
FROM CarService CS
JOIN TransactionService TS ON CS.CarServiceID = TS.CarServiceID,
(
SELECT
	[USED] = COUNT(*)
	FROM CarService CS
JOIN TransactionService TS ON CS.CarServiceID = TS.CarServiceID) [TIMES USED]
WHERE DATEPART(WEEKDAY, TransactionServiceDate) BETWEEN 1 AND 5 AND YEAR(TransactionServiceDate) = 2022 AND [USED] <5
GROUP BY CarServiceName, CarServicePrice
UNION
SELECT
CarServiceName,
[Old Price] = CarServicePrice,
[New Price] = CAST((CarServicePrice + 0.10  * CarServicePrice ) AS int)
FROM CarService CS
JOIN TransactionService TS ON CS.CarServiceID = TS.CarServiceID,
(
SELECT
	[USED] = COUNT(*)
	FROM CarService CS
JOIN TransactionService TS ON CS.CarServiceID = TS.CarServiceID) [TIMES USED]
WHERE DATEPART(WEEKDAY, TransactionServiceDate) BETWEEN 1 AND 5 AND YEAR(TransactionServiceDate) = 2022 AND [USED] BETWEEN 5 AND 10
GROUP BY CarServiceName, CarServicePrice
UNION
SELECT
CarServiceName,
[Old Price] = CarServicePrice,
[New Price] = CAST((CarServicePrice + 0.15  * CarServicePrice ) AS int)
FROM CarService CS
JOIN TransactionService TS ON CS.CarServiceID = TS.CarServiceID,
(
SELECT
	[USED] = COUNT(CS.CarServiceID)
	FROM CarService CS
JOIN TransactionService TS ON CS.CarServiceID = TS.CarServiceID) [TIMES USED]
WHERE DATEPART(WEEKDAY, TransactionServiceDate) BETWEEN 1 AND 5 AND YEAR(TransactionServiceDate) = 2022 AND [USED] >10
GROUP BY CarServiceName, CarServicePrice
ORDER BY CarServicePrice DESC

--6
SELECT
TransactionRentalID,
[Customer Name] = LOWER(CustomerName),
[Start Date] = CONVERT(varchar, StartRentalDate, 107),
TR.CarID,
[Transaction Price] = (CarPrice * CarDistance)
FROM TransactionRental TR
JOIN Customer C ON TR.CustomerID = C.CustomerID
JOIN Car CA ON TR.CarID = CA.CarID,
(
	SELECT
	AVG(CarPrice * CarDistance) AS [AvgPrice]
	FROM TransactionRental TR
	JOIN Car CA ON TR.CarID = CA.CarID
	WHERE DATEDIFF(DAY, StartRentalDate, ReturnRentalDate) <=7
)AS [AVGP]
WHERE (CarPrice * CarDistance) > AvgPrice

--7
SELECT
[Staff ID] = REPLACE(S.StaffID, 'SF', 'Employee'),
[First Name] = LEFT (StaffName, CHARINDEX(' ', StaffName)),
[Total Handled Transaction] = COUNT(ts.StaffID),
[Gained Service Fee] = (COUNT(*) * SUM(0.05 * CarServicePrice))
FROM Staff S
JOIN TransactionService TS ON S.StaffID = TS.StaffID
JOIN CarService CS ON TS.CarServiceID = CS.CarServiceID
WHERE StaffGender = 'Male' 
AND LEN(TS.StaffID) >= 4
GROUP BY S.StaffID, StaffName, CarServicePrice

--8
SELECT
CustomerName,
[Customer Phone] = REPLACE(CustomerPhoneNumber, '+62', 'IDN - '),
[Total Spent] = SUM((CarPrice * CarDistance)),
[Maximum Spent in 1 Transaction] = MAX(CarPrice * CarDistance),
[Membership Status] = 'Member'
FROM Customer CU
JOIN TransactionRental TR ON CU.CustomerID = TR.CustomerID
JOIN Car C ON TR.CarID = C.CarID
JOIN Staff S ON TR.StaffID = S.StaffID,
(
	SELECT
	TR.CustomerID,
	[rental transaction price] = SUM((CarPrice * CarDistance))
	FROM Customer CU
	JOIN TransactionRental TR ON CU.CustomerID = TR.CustomerID
	JOIN Car C ON TR.CarID = C.CarID
	WHERE CU.CustomerGender = 'MALE'
	GROUP BY TR.CustomerID
	HAVING SUM((CarPrice * CarDistance)) < 3000000
)AS MemStat

WHERE CU.CustomerID = MemStat.CustomerID AND (CarPrice * CarDistance) > 1500000
GROUP BY CustomerName, CustomerPhoneNumber
HAVING MAX(CarPrice * CarDistance) > 1500000

UNION

SELECT
CustomerName,
[Customer Phone] = REPLACE(CustomerPhoneNumber, '+62', 'IDN - '),
[Total Spent] = SUM((CarPrice * CarDistance)),
[Maximum Spent in 1 Transaction] = MAX(CarPrice * CarDistance),
[Membership Status] = 'Silver Member'
FROM Customer CU
JOIN TransactionRental TR ON CU.CustomerID = TR.CustomerID
JOIN Car C ON TR.CarID = C.CarID
JOIN Staff S ON TR.StaffID = S.StaffID,
(
	SELECT
	TR.CustomerID,
	[rental transaction price] = SUM((CarPrice * CarDistance))
	FROM Customer CU
	JOIN TransactionRental TR ON CU.CustomerID = TR.CustomerID
	JOIN Car C ON TR.CarID = C.CarID
	WHERE CU.CustomerGender = 'MALE'
	GROUP BY TR.CustomerID
	HAVING SUM((CarPrice * CarDistance)) BETWEEN 300000 AND 5000000
)AS MemStat

WHERE CU.CustomerID = MemStat.CustomerID AND (CarPrice * CarDistance) > 1500000
GROUP BY CustomerName, CustomerPhoneNumber
HAVING MAX(CarPrice * CarDistance) > 1500000

UNION

SELECT
CustomerName,
[Customer Phone] = REPLACE(CustomerPhoneNumber, '+62', 'IDN - '),
[Total Spent] = SUM((CarPrice * CarDistance)),
[Maximum Spent in 1 Transaction] = MAX(CarPrice * CarDistance),
[Membership Status] = 'Gold Member'
FROM Customer CU
JOIN TransactionRental TR ON CU.CustomerID = TR.CustomerID
JOIN Car C ON TR.CarID = C.CarID
JOIN Staff S ON TR.StaffID = S.StaffID,
(
	SELECT
	TR.CustomerID,
	[rental transaction price] = SUM((CarPrice * CarDistance))
	FROM Customer CU
	JOIN TransactionRental TR ON CU.CustomerID = TR.CustomerID
	JOIN Car C ON TR.CarID = C.CarID
	WHERE CU.CustomerGender = 'MALE'
	GROUP BY TR.CustomerID
	HAVING SUM((CarPrice * CarDistance)) >= 5000000
)AS MemStat

WHERE CU.CustomerID = MemStat.CustomerID AND (CarPrice * CarDistance) > 1500000
GROUP BY CustomerName, CustomerPhoneNumber
HAVING MAX(CarPrice * CarDistance) > 1500000

--9
CREATE VIEW [ViewMinAndMaxDistance] 
AS
SELECT
[Min Distance] =  ' km' +  CONVERT(varchar,MIN(CarDistance)),
[Max Distance] =  ' km' +  CONVERT(varchar,MAX(CarDistance))
FROM TransactionRental
WHERE DATEPART(QUARTER, StartRentalDate) = 1 AND YEAR(StartRentalDate) = 2022

--10
CREATE VIEW ViewAverageShortRentalEarning 
AS
SELECT
[Average Earning] = 'Rp. ' + CONCAT(AVG(CarPrice), '.-')
FROM TransactionRental TR
JOIN Car C ON TR.CarID = C.CarID
JOIN CarBrand CB ON C.CarBrandID = C.CarBrandID
WHERE CarBrandCountry = 'JAPAN'
GROUP BY StartRentalDate, ReturnRentalDate
HAVING DATEDIFF(DAY, StartRentalDate, ReturnRentalDate) <= MIN(DATEDIFF(DAY, StartRentalDate, ReturnRentalDate)) + 1