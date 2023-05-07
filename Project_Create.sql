--1    2501959384    Steven Ong
--2    2501970342    Farrellino Athar Nasution
--3    2502025845    Muhammad Rizky Maulana
--4    2502003011    Andre Budiman

DROP DATABASE JFAutoMobile
GO
CREATE DATABASE JFAutoMobile
GO
Use JFAutoMobile
GO

CREATE TABLE [Staff] (
	StaffID CHAR(6) PRIMARY KEY CHECK (StaffID LIKE 'SF-[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) CONSTRAINT checkStaffName CHECK (LEN(StaffName) BETWEEN 5 AND 50) NOT NULL,
	StaffEmail VARCHAR(50) CONSTRAINT checkStaffEmail CHECK (StaffEmail LIKE '%@gmail.com') NOT NULL,
	StaffGender VARCHAR(10) CONSTRAINT checkStaffGender CHECK (StaffGender IN('Male', 'Female')) NOT NULL,
	StaffAddress VARCHAR(255) CONSTRAINT checkStaffAddress CHECK (StaffAddress LIKE '%street') NOT NULL,
	StaffPhoneNumber VARCHAR(14) CONSTRAINT checkStaffPhoneNumber CHECK (StaffPhoneNumber LIKE '08%') NOT NULL,
)

CREATE TABLE [Customer] (
	CustomerID CHAR(6) PRIMARY KEY CHECK (CustomerID LIKE 'CS-[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) CONSTRAINT checkCustomerName CHECK (LEN(CustomerName) BETWEEN 5 AND 50)  NOT NULL,
	CustomerEmail VARCHAR(50) CONSTRAINT checkCustomerEmail CHECK (CustomerEmail LIKE '%@gmail.com') NOT NULL,
	CustomerGender VARCHAR(10) CONSTRAINT checkCustomerGender CHECK (CustomerGender IN('Male', 'Female')) NOT NULL,
	CustomerAddress VARCHAR (255) CONSTRAINT checkStaffAddresses CHECK (CustomerAddress LIKE '%street') NOT NULL,
	CustomerPhoneNumber VARCHAR(20) CONSTRAINT checkCustomerPhoneNumber CHECK (CustomerPhoneNumber LIKE '+62%') NOT NULL,
)

CREATE TABLE [Mechanic] (
	MechanicID CHAR(6) PRIMARY KEY CHECK (MechanicID LIKE 'MC-[0-9][0-9][0-9]'),
	MechanicName VARCHAR(50) CONSTRAINT checkMechanicName CHECK (LEN(MechanicName) BETWEEN 5 AND 50)  NOT NULL,
	MechanicEmail VARCHAR(50) CONSTRAINT checkMechanicEmail CHECK (MechanicEmail LIKE '%@gmail.com') NOT NULL,
	MechanicAddress VARCHAR (255) CONSTRAINT checkMechanicAddress CHECK (MechanicAddress LIKE '%street') NOT NULL,
	MechanicPhoneNumber VARCHAR(14) CONSTRAINT checkMechanicPhoneNumber CHECK (MechanicPhoneNumber LIKE '0%') NOT NULL,
)

CREATE TABLE [CarBrand] (
	CarBrandID CHAR(6) PRIMARY KEY CHECK (CarBrandID LIKE 'CB-[0-9][0-9][0-9]'),
	CarBrandName VARCHAR(50) NOT NULL,
	CarBrandCountry VARCHAR(50) CONSTRAINT CheckOriginCountry CHECK (CarBrandCountry IN('JAPAN', 'GERMAN', 'UNITED STATES')) NOT NULL,
)
CREATE TABLE [Car] (
	CarID CHAR(6) PRIMARY KEY CHECK (CarID LIKE 'CR-[0-9][0-9][0-9]'),
	CarBrandID CHAR(6) FOREIGN KEY REFERENCES CarBrand(CarBrandID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarName VARCHAR(50) NOT NULL,
	CarPrice INT CONSTRAINT checkCarPrice CHECK (CarPrice BETWEEN 2000 AND 4000) NOT NULL,
	CarSeatCapacity VARCHAR(50) CONSTRAINT checkCarSeatCapacity CHECK (CarSeatCapacity BETWEEN 1 AND 6)  NOT NULL,
	CarEngineCapacity INT CONSTRAINT checkCarEngineCapacity CHECK (CarEngineCapacity BETWEEN 1000 AND 3000)  NOT NULL,
	CarAvailability VARCHAR(100) CONSTRAINT checkCarAvailability CHECK (CarAvailability IN('0', '1')) NOT NULL,
)


CREATE TABLE [TransactionRental] (
	TransactionRentalID CHAR(6) PRIMARY KEY CHECK (TransactionRentalID LIKE 'TR-[0-9][0-9][0-9]'),
	StaffID CHAR(6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(6) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarID CHAR(6) FOREIGN KEY REFERENCES Car(CarID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StartRentalDate DATE NOT NULL,
	ReturnRentalDate DATE CONSTRAINT checkReturnRentalDate CHECK (ReturnRentalDate >= GETDATE()) NOT NULL,
	CarDistance INT CONSTRAINT checkCarDistance CHECK (CarDistance IS NULL OR CarDistance > 0),
)

CREATE TABLE [CarService](
    CarServiceID CHAR(6) PRIMARY KEY CHECK (CarServiceID LIKE 'SV-[0-9][0-9][0-9]'),
    CarServiceName VARCHAR (50) NOT NULL,
    CarServicePrice INT CONSTRAINT CarServicePrice CHECK (CarServicePrice BETWEEN 100000 AND 1000000) NOT NULL,
)

CREATE TABLE [TransactionService](
    TransactionServiceID CHAR(6) PRIMARY KEY CHECK (TransactionServiceID LIKE 'TS-[0-9][0-9][0-9]'),
    StaffID CHAR(6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    MechanicID CHAR(6) FOREIGN KEY REFERENCES Mechanic(MechanicID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    CarID CHAR(6) FOREIGN KEY REFERENCES Car(CarID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarServiceID CHAR(6) FOREIGN KEY REFERENCES CarService(CarServiceID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    TransactionServiceDate DATE CONSTRAINT TransactionServiceDate CHECK (TransactionServiceDate >= GETDATE()) NOT NULL,
)