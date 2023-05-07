--1    2501959384    Steven Ong
--2    2501970342    Farrellino Athar Nasution
--3    2502025845    Muhammad Rizky Maulana
--4    2502003011    Andre Budiman

USE JFAutoMobile
GO
--BEGIN TRANSACTION
GO
INSERT INTO Staff VALUES
('SF-001', 'Steven Ong', 'steven88@gmail.com', 'Male', 'Sunter Karya street', '081283366251'),
('SF-002', 'Andre Bud', 'andre302@gmail.com', 'Male', 'Kebon Kacang street', '081261650324'),
('SF-003', 'Farrellino Athar', 'farel.lino@gmail.com', 'Male', 'Tebet street', '081213141415'),
('SF-004', 'Rizky Maul', 'rizkymaul4na@gmail.com', 'Male', 'Setia Budi street', '081241412324'),
('SF-005', 'Sultan Haram', 'sultanorkay@gmail.com', 'Male', 'Menteng street', '081123432534'),
('SF-006', 'Felicia Snow', 'feli2948@gmail.com', 'Female', 'Kemanggisan street', '081938472645'),
('SF-007', 'Nurli Ann', 'nur234@gmail.com', 'Female', 'Kelapa Gading street', '081274859305'),
('SF-008', 'Ayunda Maudy', 'ayu2342@gmail.com', 'Female', 'Bendungan Hilir street', '081162473484'),
('SF-009', 'Emily Lily', 'eimiliy13@gmail.com', 'Female', 'Kebon Jeruk street', '081543567765'),
('SF-010', 'Jennifer Law', 'jenniper2324@gmail.com', 'Female', 'Cengkareng street', '081232456532')

INSERT INTO Customer VALUES
('CS-001', 'Rezha', 'rezacool1@gmail.com', 'Male', 'Pondok Gede street', '+6281283366251'),
('CS-002', 'Basil', 'basilomori12@gmail.com', 'Male', 'Kemayoran street', '+6281432876456'),
('CS-003', 'David', 'haigaisdaviddisini@gmail.com', 'Male', 'Gambir street', '+6281098235674'),
('CS-004', 'Daffa', 'dapaabraree@gmail.com', 'Male', 'Palmerah street', '+6281982367482'),
('CS-005', 'Hafid', 'hafidhiatm4@gmail.com', 'Male', 'Ciracas street', '+6281028395825'),
('CS-006', 'Adelia', 'adhelie@gmail.com', 'Female', 'Jagakarsa street', '+6281152635142'),
('CS-007', 'Aghni', 'aghnee@gmail.com', 'Female', 'Koja street', '+6281114452253'),
('CS-008', 'Farah', 'f4r4h000@gmail.com', 'Female', 'Cilacang street', '+6281381926374'),
('CS-009', 'Safira', 'Safierap@gmail.com', 'Female', 'Cilandak street', '+6281483726374'),
('CS-010', 'Lativa', 'tipaohtipa23@gmail.com', 'Female', 'Cipayung street', '+6281098726364')

INSERT INTO Mechanic VALUES
('MC-001', 'Budhi', 'budi325@gmail.com', 'Rawa Kepa street', '0812856464'),
('MC-002', 'Andhi', 'andi122@gmail.com', 'Kemayoran street', '0812542315'),
('MC-003', 'Aksah', 'aksa999@gmail.com', 'Sunter Agung street', '081299810'),
('MC-004', 'Azura', 'azura11@gmail.com', 'Nyiur street', '0878525815'),
('MC-005', 'Kelvin', 'kelv333@gmail.com', 'Batu Merah street', '081321455'),
('MC-006', 'Goerge', 'gorg222@gmail.com', 'Angsana Raya street', '08154445264'),
('MC-007', 'Githa', 'git4@gmail.com', 'Kalibata Tengah street', '0812832512'),
('MC-008', 'Ginela', 'gingin@gmail.com', 'Kalibata Timur street', '081879852'),
('MC-009', 'Hayyu', 'hayu221@gmail.com', 'Sunter Jaya street', '0854325131'),
('MC-010', 'Ayunda', 'ayu987@gmail.com', 'Bina Harapan street', '0818746554')

INSERT INTO CarBrand Values
('CB-001', 'Honda', 'JAPAN'),
('CB-002', 'Nissan', 'JAPAN'),
('CB-003', 'Toyota', 'JAPAN'),
('CB-004', 'Mitsubishi', 'JAPAN'),
('CB-005', 'Ford', 'UNITED STATES'),
('CB-006', 'Volkswagen', 'GERMAN'),
('CB-007', 'Tesla', 'UNITED STATES'),
('CB-008', 'Chevrolet', 'UNITED STATES'),
('CB-009', 'BMW', 'GERMAN'),
('CB-010', 'Audi', 'GERMAN')

INSERT INTO Car Values
('CR-001', 'CB-001', 'Brio', '2000', '4', '1198', '1'),
('CR-002', 'CB-001', 'Jazz', '2200', '4', '1999', '1'),
('CR-003', 'CB-003', 'Fortuner', '3400', '6', '2755', '1'),
('CR-004', 'CB-004', 'Pajero', '3300', '6', '2477', '1'),
('CR-005', 'CB-001', 'Civic', '2600', '4', '1597', '1'),
('CR-006', 'CB-003', 'Cayla', '2000', '6', '1197', '1'),
('CR-007', 'CB-001', 'Freed', '2500', '6', '1496', '1'),
('CR-008', 'CB-003', 'VellFire', '3000', '6', '2494', '1'),
('CR-009', 'CB-003', 'Innova', '2100', '6', '2494', '1'),
('CR-010', 'CB-010', 'R8', '2000', '4', '2462', '1')


INSERT INTO TransactionRental VALUES
('TR-001', 'SF-001', 'CS-003', 'CR-003', '2022-01-05', '2022-07-08', 5000),
('TR-002', 'SF-003', 'CS-002', 'CR-002', '2022-01-15', '2022-07-20', 2000),
('TR-003', 'SF-006', 'CS-001', 'CR-006', '2022-02-09', '2022-07-12', 3000),
('TR-004', 'SF-004', 'CS-001', 'CR-001', '2022-02-18', '2022-07-23', 10000),
('TR-005', 'SF-002', 'CS-003', 'CR-004', '2022-03-02', '2022-07-06', 5000),
('TR-006', 'SF-007', 'CS-004', 'CR-005', '2022-03-24', '2022-07-30', 7000),
('TR-007', 'SF-008', 'CS-008', 'CR-009', '2022-04-06', '2022-07-08', 6000),
('TR-008', 'SF-010', 'CS-006', 'CR-009', '2022-04-27', '2022-07-29', 4000),
('TR-009', 'SF-009', 'CS-005', 'CR-008', '2022-05-15', '2022-07-20', 12000),
('TR-010', 'SF-001', 'CS-009', 'CR-010', '2022-05-11', '2022-07-14', 20000),
('TR-011', 'SF-002', 'CS-009', 'CR-007', '2022-05-19', '2022-07-23', 20000),
('TR-012', 'SF-005', 'CS-010', 'CR-006', '2022-05-29', '2022-07-30', 9000),
('TR-013', 'SF-005', 'CS-001', 'CR-008', '2022-06-08', '2022-07-11', 7500),
('TR-014', 'SF-002', 'CS-007', 'CR-010', '2022-06-16', '2022-07-21', 50000),
('TR-015', 'SF-008', 'CS-002', 'CR-001', '2022-06-24', '2022-07-29', 10000),
('TR-016', 'SF-009', 'CS-004', 'CR-003', '2022-07-24', '2022-07-29', 50000),
('TR-017', 'SF-005', 'CS-001', 'CR-005', '2022-08-14', '2022-08-18', 9000),
('TR-018', 'SF-010', 'CS-006', 'CR-009', '2022-09-17', '2022-09-23', 7500)

INSERT INTO CarService VALUES
('SV-001','Manual Motor Repair', '200000'),
('SV-002','Oil Change', '300000'),
('SV-003','Oil Filter Replacement', '300000'),
('SV-004','Windshield Wipers and Fluid', '500000'),
('SV-005','Air and Cabin Filter Replacement', '800000'),
('SV-006','Scheduled Maintenance', '100000'),
('SV-007','Oil Change and Oil Filter Replacement', '1000000'),
('SV-008','Tire Replacement', '500000'),
('SV-009','Windshield Wipers and Fluid', '200000'),
('SV-010','Battery Replacement', '1000000'),
('SV-011','Brake Repair', '700000'),
('SV-012','Scheduled Maintenance', '500000'),
('SV-013','Manual Motor Repair', '300000'),
('SV-014','Tire Replacement', '600000'),
('SV-015','Coolant System Services', '900000'),
('SV-016','Wheel Balance and Rotation', '400000'),
('SV-017','Manual Motor Repair', '500000'),
('SV-018','Scheduled Maintenance', '700000'),
('SV-019','Air and Cabin Filter Replacement', '500000'),
('SV-020','Coolant System Services', '400000'),
('SV-021','Windshield Wipers and Fluid', '800000'),
('SV-022','Manual Motor Repair', '1000000'),
('SV-023','Tire Replacement', '600000'),
('SV-024','Wheel Balance and Rotation', '600000'),
('SV-025','Scheduled Maintenance', '200000')

INSERT INTO TransactionService VALUES
('TS-001', 'SF-001', 'MC-001', 'CR-003', 'SV-001', '2022-07-05'),
('TS-002', 'SF-003', 'MC-003', 'CR-002', 'SV-002', '2022-07-15'),
('TS-003', 'SF-006', 'MC-003', 'CR-006', 'SV-003', '2022-07-09'),
('TS-004', 'SF-004', 'MC-008', 'CR-001', 'SV-004', '2022-07-18'),
('TS-005', 'SF-002', 'MC-006', 'CR-004', 'SV-005', '2022-07-02'),
('TS-006', 'SF-007', 'MC-002', 'CR-005', 'SV-006', '2022-07-24'),
('TS-007', 'SF-008', 'MC-005', 'CR-009', 'SV-007', '2022-07-06'),
('TS-008', 'SF-010', 'MC-008', 'CR-009', 'SV-008', '2022-07-27'),
('TS-009', 'SF-009', 'MC-009', 'CR-008', 'SV-009', '2022-07-15'),
('TS-010', 'SF-001', 'MC-008', 'CR-010', 'SV-010', '2022-07-11'),
('TS-011', 'SF-002', 'MC-010', 'CR-007', 'SV-011', '2022-07-19'),
('TS-012', 'SF-005', 'MC-010', 'CR-006', 'SV-012', '2022-07-29'),
('TS-013', 'SF-005', 'MC-009', 'CR-008', 'SV-013', '2022-07-08'),
('TS-014', 'SF-003', 'MC-008', 'CR-010', 'SV-014', '2022-07-16'),
('TS-015', 'SF-008', 'MC-008', 'CR-001', 'SV-015', '2022-07-24'),
('TS-016', 'SF-001', 'MC-001', 'CR-003', 'SV-016', '2022-07-05'),
('TS-017', 'SF-003', 'MC-003', 'CR-002', 'SV-017', '2022-07-15'),
('TS-018', 'SF-006', 'MC-003', 'CR-006', 'SV-018', '2022-07-09'),
('TS-019', 'SF-004', 'MC-008', 'CR-001', 'SV-019', '2022-07-18'),
('TS-020', 'SF-002', 'MC-006', 'CR-004', 'SV-020', '2022-07-02'),
('TS-021', 'SF-007', 'MC-002', 'CR-005', 'SV-021', '2022-07-24'),
('TS-022', 'SF-008', 'MC-005', 'CR-009', 'SV-022', '2022-07-06'),
('TS-023', 'SF-010', 'MC-008', 'CR-009', 'SV-023', '2022-07-27'),
('TS-024', 'SF-009', 'MC-009', 'CR-008', 'SV-024', '2022-07-15'),
('TS-025', 'SF-001', 'MC-008', 'CR-010', 'SV-025', '2022-07-11'),
('TS-026', 'SF-002', 'MC-010', 'CR-007', 'SV-001', '2022-07-19'),
('TS-027', 'SF-005', 'MC-010', 'CR-006', 'SV-002', '2022-07-29'),
('TS-028', 'SF-005', 'MC-009', 'CR-008', 'SV-013', '2022-07-08'),
('TS-029', 'SF-003', 'MC-008', 'CR-010', 'SV-019', '2022-07-16'),
('TS-030', 'SF-008', 'MC-008', 'CR-001', 'SV-025', '2022-07-24')