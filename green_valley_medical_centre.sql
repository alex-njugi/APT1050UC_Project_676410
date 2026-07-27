-- APT1050 Database Systems Project
-- Green Valley Medical Centre
-- MySQL 8.0 compatible

DROP DATABASE IF EXISTS green_valley_medical_centre;
CREATE DATABASE green_valley_medical_centre;
USE green_valley_medical_centre;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F','Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(150) NOT NULL
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(80) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Scheduled','Completed','Cancelled','No-show') NOT NULL DEFAULT 'Scheduled',
    reason VARCHAR(200) NOT NULL,
    CONSTRAINT fk_appointment_patient
        FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_doctor
        FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT uq_doctor_slot UNIQUE (doctor_id, appointment_date, appointment_time)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL UNIQUE,
    treatment_name VARCHAR(100) NOT NULL,
    description VARCHAR(250),
    treatment_cost DECIMAL(10,2) NOT NULL CHECK (treatment_cost >= 0),
    CONSTRAINT fk_treatment_appointment
        FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    treatment_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_method ENUM('Cash','M-Pesa','Card','Bank Transfer') NOT NULL,
    reference_number VARCHAR(40) NOT NULL UNIQUE,
    CONSTRAINT fk_payment_patient
        FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_payment_treatment
        FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO Patients (patient_id, first_name, last_name, gender, date_of_birth, phone, email, address) VALUES
(1, 'Brian', 'Mwangi', 'M', '2001-03-14', '0712345601', 'brian.mwangi@example.com', 'Ruiru, Kiambu'),
(2, 'Faith', 'Wanjiku', 'F', '1998-07-22', '0712345602', 'faith.wanjiku@example.com', 'Kasarani, Nairobi'),
(3, 'Kevin', 'Otieno', 'M', '2004-11-05', '0712345603', 'kevin.otieno@example.com', 'Embakasi, Nairobi'),
(4, 'Mercy', 'Achieng', 'F', '1987-01-18', '0712345604', 'mercy.achieng@example.com', 'Donholm, Nairobi'),
(5, 'Samuel', 'Kiptoo', 'M', '1993-09-30', '0712345605', 'samuel.kiptoo@example.com', 'South B, Nairobi'),
(6, 'Joy', 'Njeri', 'F', '2002-05-11', '0712345606', 'joy.njeri@example.com', 'Juja, Kiambu'),
(7, 'Daniel', 'Mutiso', 'M', '1979-12-02', '0712345607', 'daniel.mutiso@example.com', 'Umoja, Nairobi'),
(8, 'Esther', 'Chebet', 'F', '1995-04-27', '0712345608', 'esther.chebet@example.com', 'Zimmerman, Nairobi'),
(9, 'Peter', 'Kamau', 'M', '1989-08-16', '0712345609', 'peter.kamau@example.com', 'Thika, Kiambu'),
(10, 'Linda', 'Atieno', 'F', '2000-10-09', '0712345610', 'linda.atieno@example.com', 'RoySambu, Nairobi');

INSERT INTO Doctors (doctor_id, first_name, last_name, specialization, phone, email) VALUES
(1, 'Dr. Alice', 'Kariuki', 'General Medicine', '0722001101', 'alice.kariuki@greenvalley.co.ke'),
(2, 'Dr. Joseph', 'Omondi', 'Paediatrics', '0722001102', 'joseph.omondi@greenvalley.co.ke'),
(3, 'Dr. Mary', 'Wambui', 'Dermatology', '0722001103', 'mary.wambui@greenvalley.co.ke'),
(4, 'Dr. David', 'Kiplangat', 'Orthopaedics', '0722001104', 'david.kiplangat@greenvalley.co.ke'),
(5, 'Dr. Ruth', 'Muli', 'Gynaecology', '0722001105', 'ruth.muli@greenvalley.co.ke');

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, status, reason) VALUES
(1, 1, 1, '2026-07-20', '09:00:00', 'Completed', 'Persistent headache'),
(2, 2, 3, '2026-07-21', '10:30:00', 'Completed', 'Skin rash'),
(3, 3, 1, '2026-07-22', '11:00:00', 'Completed', 'Fever and fatigue'),
(4, 4, 5, '2026-07-23', '14:00:00', 'Completed', 'Routine review'),
(5, 5, 4, '2026-07-24', '08:30:00', 'Completed', 'Knee pain'),
(6, 6, 1, '2026-07-25', '12:00:00', 'Completed', 'Flu symptoms'),
(7, 7, 4, '2026-07-26', '15:30:00', 'Completed', 'Back pain'),
(8, 8, 2, '2026-07-27', '09:30:00', 'Completed', 'Child vaccination consultation'),
(9, 9, 1, '2026-07-28', '10:00:00', 'Scheduled', 'Blood pressure review'),
(10, 10, 3, '2026-07-29', '13:00:00', 'Scheduled', 'Acne consultation'),
(11, 1, 1, '2026-07-30', '11:30:00', 'Scheduled', 'Follow-up headache'),
(12, 2, 5, '2026-07-31', '16:00:00', 'Scheduled', 'Women''s health review'),
(13, 3, 2, '2026-08-01', '08:00:00', 'Scheduled', 'Paediatric review'),
(14, 4, 1, '2026-08-02', '09:00:00', 'Scheduled', 'General check-up'),
(15, 5, 4, '2026-08-05', '14:30:00', 'Scheduled', 'Knee follow-up');

INSERT INTO Treatments (treatment_id, appointment_id, treatment_name, description, treatment_cost) VALUES
(1, 1, 'Medical Consultation', 'General examination and prescription', 2500.0),
(2, 2, 'Dermatology Consultation', 'Skin assessment and topical medication', 4200.0),
(3, 3, 'Laboratory Tests', 'Full blood count and malaria test', 3800.0),
(4, 4, 'Gynaecology Review', 'Routine reproductive health review', 5000.0),
(5, 5, 'X-Ray Examination', 'Knee X-ray and orthopaedic assessment', 6500.0),
(6, 6, 'Flu Treatment', 'Consultation and medication', 3100.0),
(7, 7, 'Physiotherapy Session', 'Initial back-pain therapy session', 4500.0),
(8, 8, 'Vaccination', 'Child vaccination and consultation', 2800.0),
(9, 9, 'Blood Pressure Review', 'BP monitoring and medication review', 2300.0),
(10, 10, 'Acne Treatment', 'Dermatology review and prescribed treatment', 4800.0),
(11, 11, 'Follow-up Consultation', 'Follow-up examination', 1800.0),
(12, 12, 'Ultrasound Scan', 'Pelvic ultrasound and review', 7000.0),
(13, 13, 'Paediatric Consultation', 'Child wellness assessment', 3000.0),
(14, 14, 'Executive Check-up', 'Comprehensive general examination', 8500.0),
(15, 15, 'Orthopaedic Follow-up', 'Knee assessment and therapy plan', 4000.0);

INSERT INTO Payments (payment_id, patient_id, treatment_id, payment_date, amount, payment_method, reference_number) VALUES
(1, 1, 1, '2026-07-20', 2500.0, 'M-Pesa', 'MPESA-GV001'),
(2, 2, 2, '2026-07-21', 4200.0, 'Card', 'CARD-GV002'),
(3, 3, 3, '2026-07-22', 2000.0, 'M-Pesa', 'MPESA-GV003'),
(4, 4, 4, '2026-07-23', 5000.0, 'Bank Transfer', 'BANK-GV004'),
(5, 5, 5, '2026-07-24', 4000.0, 'M-Pesa', 'MPESA-GV005'),
(6, 6, 6, '2026-07-25', 3100.0, 'Cash', 'CASH-GV006'),
(7, 7, 7, '2026-07-26', 3000.0, 'M-Pesa', 'MPESA-GV007'),
(8, 8, 8, '2026-07-27', 2800.0, 'Card', 'CARD-GV008'),
(9, 9, 9, '2026-07-28', 1000.0, 'M-Pesa', 'MPESA-GV009'),
(10, 10, 10, '2026-07-29', 4800.0, 'M-Pesa', 'MPESA-GV010'),
(11, 1, 11, '2026-07-30', 1000.0, 'Cash', 'CASH-GV011'),
(12, 2, 12, '2026-07-31', 5000.0, 'Bank Transfer', 'BANK-GV012'),
(13, 3, 13, '2026-08-01', 3000.0, 'M-Pesa', 'MPESA-GV013'),
(14, 4, 14, '2026-08-02', 6000.0, 'Card', 'CARD-GV014'),
(15, 5, 15, '2026-08-05', 2500.0, 'M-Pesa', 'MPESA-GV015');


-- Q1: Doctor who attended the highest number of patients
SELECT CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
       COUNT(DISTINCT a.patient_id) AS patients_attended
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY patients_attended DESC
LIMIT 1;

-- Q2: Patients with outstanding payments (uses a subquery)
SELECT p.patient_id,
       CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
       SUM(t.treatment_cost) AS total_charges,
       COALESCE((SELECT SUM(py.amount)
                 FROM Payments py
                 WHERE py.patient_id = p.patient_id), 0) AS total_paid,
       SUM(t.treatment_cost) -
       COALESCE((SELECT SUM(py.amount)
                 FROM Payments py
                 WHERE py.patient_id = p.patient_id), 0) AS outstanding_balance
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Treatments t ON a.appointment_id = t.appointment_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING outstanding_balance > 0
ORDER BY outstanding_balance DESC;

-- Q3: Total revenue collected
SELECT SUM(amount) AS total_revenue_collected
FROM Payments;

-- Q4: Treatment that generated the highest income
SELECT t.treatment_name, SUM(p.amount) AS income_generated
FROM Treatments t
JOIN Payments p ON t.treatment_id = p.treatment_id
GROUP BY t.treatment_name
ORDER BY income_generated DESC
LIMIT 1;

-- Q5: Appointments scheduled within the next seven days
SELECT a.appointment_id,
       CONCAT(pt.first_name, ' ', pt.last_name) AS patient_name,
       CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
       a.appointment_date, a.appointment_time, a.status
FROM Appointments a
JOIN Patients pt ON a.patient_id = pt.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
  AND a.status = 'Scheduled'
ORDER BY a.appointment_date, a.appointment_time;

-- Successful payment transaction
START TRANSACTION;
INSERT INTO Payments
(patient_id, treatment_id, payment_date, amount, payment_method, reference_number)
VALUES (3, 3, CURDATE(), 1800.00, 'M-Pesa', 'MPESA-GV016');
UPDATE Treatments
SET description = CONCAT(description, ' - Fully paid')
WHERE treatment_id = 3;
COMMIT;

-- Failed transaction demonstration
START TRANSACTION;
INSERT INTO Payments
(patient_id, treatment_id, payment_date, amount, payment_method, reference_number)
VALUES (5, 5, CURDATE(), 2500.00, 'M-Pesa', 'MPESA-GV017');
UPDATE Treatments
SET description = CONCAT(description, ' - Payment processing')
WHERE treatment_id = 5;
-- Assume a failure occurs before completion:
ROLLBACK;
