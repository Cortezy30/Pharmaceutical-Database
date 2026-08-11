INSERT INTO Drug (DrugName, Branded, PatentExpirationDate)
VALUES
('Cardiava', TRUE,  '2029-06-15'),
('Respira', TRUE,   '2027-11-30'),
('GlucoFree', TRUE, '2031-03-20'),
('Amoxicillin', FALSE, NULL),
('Lisinopril', FALSE, NULL),
('Neurocalm', TRUE, '2028-09-10'),
('Metformin', FALSE, NULL),
('Dermacure', TRUE, '2030-01-25'),
('Atorvastatin', FALSE, NULL),
('Painrelief', FALSE, NULL);


INSERT INTO DrugFormulation (DrugID, DosageForm, Strength)
VALUES
(1, 'Tablet',  '10mg'),
(1, 'Tablet',  '20mg'),
(2, 'Inhaler', '100mcg'),
(2, 'Inhaler', '200mcg'),
(3, 'Tablet',  '500mg'),
(3, 'Tablet',  '1000mg'),
(4, 'Capsule', '250mg'),
(4, 'Capsule', '500mg'),
(5, 'Tablet',  '10mg'),
(6, 'Tablet',  '25mg'),
(7, 'Tablet',  '500mg'),
(7, 'Tablet',  '1000mg'),
(8, 'Cream',   '1%'),
(9, 'Tablet',  '20mg'),
(10, 'Tablet', '500mg');



INSERT INTO Countries (Name)
VALUES
('United States'),
('Canada'),
('United Kingdom'),
('Germany'),
('France'),
('Japan'),
('Australia'),
('Brazil'),
('Mexico'),
('India');



INSERT INTO Costs
    (DrugID, DosageForm, Strength, CountryID,
     ManufacturingCostPerUnit, ShippingCostPerUnit)
VALUES

-- Cardiava 10mg
(1, 'Tablet', '10mg', 1, 2.10, 0.25),
(1, 'Tablet', '10mg', 2, 2.10, 0.40),
(1, 'Tablet', '10mg', 3, 2.15, 0.55),
(1, 'Tablet', '10mg', 4, 2.15, 0.60),

-- Cardiava 20mg
(1, 'Tablet', '20mg', 1, 3.00, 0.25),
(1, 'Tablet', '20mg', 2, 3.00, 0.40),

-- Respira 100mcg
(2, 'Inhaler', '100mcg', 1, 5.50, 0.75),
(2, 'Inhaler', '100mcg', 3, 5.60, 0.85),
(2, 'Inhaler', '100mcg', 4, 5.60, 0.90),

-- Respira 200mcg
(2, 'Inhaler', '200mcg', 1, 7.00, 0.75),
(2, 'Inhaler', '200mcg', 6, 7.10, 1.10),

-- GlucoFree 500mg
(3, 'Tablet', '500mg', 1, 1.20, 0.20),
(3, 'Tablet', '500mg', 5, 1.25, 0.45),
(3, 'Tablet', '500mg', 10, 1.30, 0.70),

-- GlucoFree 1000mg
(3, 'Tablet', '1000mg', 1, 1.80, 0.20),
(3, 'Tablet', '1000mg', 10, 1.90, 0.70),

-- Amoxicillin 250mg
(4, 'Capsule', '250mg', 1, 0.40, 0.10),
(4, 'Capsule', '250mg', 8, 0.45, 0.65),

-- Amoxicillin 500mg
(4, 'Capsule', '500mg', 1, 0.65, 0.10),
(4, 'Capsule', '500mg', 10, 0.70, 0.70),

-- Lisinopril
(5, 'Tablet', '10mg', 1, 0.30, 0.10),
(5, 'Tablet', '10mg', 4, 0.32, 0.55),

-- Neurocalm
(6, 'Tablet', '25mg', 1, 1.50, 0.20),
(6, 'Tablet', '25mg', 3, 1.55, 0.50),

-- Metformin 500mg
(7, 'Tablet', '500mg', 1, 0.25, 0.10),
(7, 'Tablet', '500mg', 6, 0.28, 0.75),

-- Metformin 1000mg
(7, 'Tablet', '1000mg', 1, 0.40, 0.10),
(7, 'Tablet', '1000mg', 10, 0.45, 0.70),

-- Dermacure
(8, 'Cream', '1%', 1, 3.20, 0.25),
(8, 'Cream', '1%', 5, 3.25, 0.55),

-- Atorvastatin
(9, 'Tablet', '20mg', 1, 0.60, 0.10),
(9, 'Tablet', '20mg', 4, 0.65, 0.55),

-- Painrelief
(10, 'Tablet', '500mg', 1, 0.15, 0.08),
(10, 'Tablet', '500mg', 9, 0.18, 0.60);



INSERT INTO Sales
    (DrugID, DosageForm, Strength, CountryID,
     QuantitySold, SalePricePerUnit, SaleDate)
VALUES

-- Cardiava 10mg
(1, 'Tablet', '10mg', 1, 12500, 8.50, '2026-01-15'),
(1, 'Tablet', '10mg', 2,  8500, 9.25, '2026-02-10'),
(1, 'Tablet', '10mg', 3,  7200, 9.50, '2026-03-05'),
(1, 'Tablet', '10mg', 4,  6800, 9.75, '2026-04-12'),

-- Cardiava 20mg
(1, 'Tablet', '20mg', 1,  9200, 12.50, '2026-02-20'),
(1, 'Tablet', '20mg', 2,  5100, 13.00, '2026-03-18'),

-- Respira 100mcg
(2, 'Inhaler', '100mcg', 1, 15000, 15.00, '2026-01-25'),
(2, 'Inhaler', '100mcg', 3,  9400, 16.25, '2026-02-28'),
(2, 'Inhaler', '100mcg', 4,  8200, 16.00, '2026-03-22'),

-- Respira 200mcg
(2, 'Inhaler', '200mcg', 1,  6200, 21.00, '2026-04-15'),
(2, 'Inhaler', '200mcg', 6,  4300, 22.00, '2026-05-10'),

-- GlucoFree 500mg
(3, 'Tablet', '500mg', 1, 18000, 5.00, '2026-01-12'),
(3, 'Tablet', '500mg', 5,  7600, 5.50, '2026-02-15'),
(3, 'Tablet', '500mg', 10, 9200, 4.75, '2026-03-17'),

-- GlucoFree 1000mg
(3, 'Tablet', '1000mg', 1, 11500, 7.50, '2026-04-20'),
(3, 'Tablet', '1000mg', 10, 5800, 7.25, '2026-05-15'),

-- Amoxicillin 250mg
(4, 'Capsule', '250mg', 1, 22000, 2.00, '2026-01-08'),
(4, 'Capsule', '250mg', 8,  8500, 2.25, '2026-02-11'),

-- Amoxicillin 500mg
(4, 'Capsule', '500mg', 1, 17500, 3.25, '2026-03-09'),
(4, 'Capsule', '500mg', 10, 6200, 3.50, '2026-04-03'),

-- Lisinopril
(5, 'Tablet', '10mg', 1, 25000, 1.75, '2026-01-20'),
(5, 'Tablet', '10mg', 4, 11200, 1.90, '2026-02-25'),

-- Neurocalm
(6, 'Tablet', '25mg', 1, 7800, 6.50, '2026-03-14'),
(6, 'Tablet', '25mg', 3, 4900, 7.00, '2026-04-18'),

-- Metformin 500mg
(7, 'Tablet', '500mg', 1, 28000, 1.50, '2026-01-05'),
(7, 'Tablet', '500mg', 6,  9400, 1.65, '2026-02-09'),

-- Metformin 1000mg
(7, 'Tablet', '1000mg', 1, 19500, 2.25, '2026-03-12'),
(7, 'Tablet', '1000mg', 10, 7100, 2.50, '2026-04-14'),

-- Dermacure
(8, 'Cream', '1%', 1, 6700, 9.50, '2026-05-01'),
(8, 'Cream', '1%', 5, 3100, 10.25, '2026-05-20'),

-- Atorvastatin
(9, 'Tablet', '20mg', 1, 16500, 3.75, '2026-06-05'),
(9, 'Tablet', '20mg', 4,  7200, 4.00, '2026-06-18'),

-- Painrelief
(10, 'Tablet', '500mg', 1, 32000, 0.90, '2026-06-25'),
(10, 'Tablet', '500mg', 9, 11800, 1.00, '2026-07-02');