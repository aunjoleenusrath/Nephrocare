
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dateOfBirth DATE,
    gender VARCHAR(10),
    contact VARCHAR(15),
    address TEXT,
    blood_group VARCHAR(5),
    renal_stage VARCHAR(50),
    insurance_id VARCHAR(20),
    emergency_contact VARCHAR(15),
    allergies TEXT,
    height_cm INT,
    weight_kg DECIMAL(5,2)
);

INSERT INTO Patients VALUES (1, 'CGO MD AAMEER-UL-HAQUE', '1980-08-16', 'MALE', '01711934444', 'CANTONMENT', 'B+', 'Stage 2', 'INS001', '01858147994', 'None', 172, 68.5);
INSERT INTO Patients VALUES (2, 'lily collins', '1992-07-05', 'Female', '9123456781', 'jordan', 'O+', 'Stage 5 (ESRD)', NULL, '9988776655', 'Penicillin', 158, 54.2);
INSERT INTO Patients VALUES (3, 'brad pitt', '1985-11-20', 'Male', '9123456782', 'cambodia', 'A+', 'Stage 3', 'INS002', '8877665544', 'Latex', 180, 80.0);
INSERT INTO Patients VALUES (4, 'julia roberts', '1975-02-08', 'Female', '9123456783', 'egypt', 'AB-', 'Stage 2', NULL, '7788990011', 'Sulfa drugs', 162, 59.3);
INSERT INTO Patients VALUES (5, 'tom cruise', '1969-09-18', 'Male', '9123456784', 'italy', 'O-', 'Stage 5 (ESRD)', 'INS003', '6655443322', 'None', 170, 75.7);
INSERT INTO Patients VALUES (6, 'emma stone', '2000-05-22', 'Female', '9123456785', 'peru', 'A-', 'Stage 1', NULL, '9876601234', 'Aspirin', 155, 48.6);
INSERT INTO Patients VALUES (7, 'hugh jackman', '1988-12-30', 'Male', '9123456786', 'barcelona', 'B-', 'Stage 3', 'INS004', '9123409876', 'None', 168, 72.1);
INSERT INTO Patients VALUES (8, 'nicole kidman', '1995-04-14', 'Female', '9123456787', 'UAE', 'AB+', 'Stage 2', NULL, '9345612789', 'Seafood', 161, 56.8);
INSERT INTO Patients VALUES (9, 'lara jean', '1992-07-05', 'Female', '9123456781', 'jordan', 'O+', 'Stage 5 (ESRD)', NULL, '9988776655', 'Penicillin', 158, 54.2);
INSERT INTO Patients VALUES (10, 'tom holland', '1985-11-20', 'Male', '9123456782', 'cambodia', 'A+', 'Stage 3', 'INS002', '8877665544', 'Latex', 180, 80.0);
INSERT INTO Patients VALUES (11, 'julia mary', '1975-02-08', 'Female', '9123456783', 'egypt', 'AB-', 'Stage 2', NULL, '7788990011', 'Sulfa drugs', 162, 59.3);
INSERT INTO Patients VALUES (12, 'noah centineo', '1969-09-18', 'Male', '9123456784', 'italy', 'O-', 'Stage 5 (ESRD)', 'INS003', '6655443322', 'None', 170, 75.7);
INSERT INTO Patients VALUES (13, 'jordan fisher', '2000-05-22', 'Female', '9123456785', 'peru', 'A-', 'Stage 1', NULL, '9876601234', 'Aspirin', 155, 48.6);
INSERT INTO Patients VALUES (14, 'andrew garfeild', '1988-12-30', 'Male', '9123456786', 'barcelona', 'B-', 'Stage 3', 'INS004', '9123409876', 'None', 168, 72.1);
INSERT INTO Patients VALUES (15, 'ryan gosling', '1995-04-14', 'Female', '9123456787', 'UAE', 'AB+', 'Stage 2', NULL, '9345612789', 'Seafood', 161, 56.8);

DELETE FROM Patients WHERE patient_id = 14;

ALTER TABLE Patients ADD COLUMN insurance_provider VARCHAR(100);

SELECT * FROM Patients WHERE gender = 'Male' AND renal_stage = 'Stage 2';

SELECT * FROM Patients WHERE gender = 'Female' OR blood_group = 'O+';

SELECT patient_id, name, renal_stage
FROM Patients
WHERE renal_stage IN ('Stage 3', 'Stage 4', 'Stage 5 (ESRD)');



SELECT * FROM Patients;


CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    experience_years INT,
    qualification VARCHAR(100)
);
INSERT INTO Doctors VALUES (1, 'Dr. rahtun zaman', 'Nephrologist', '123-456-7890', 'zaman@email.com', 15, 'MD');
INSERT INTO Doctors VALUES (2, 'Dr. aunjolee nusrath anu', 'Cardiologist', '123-555-7891', 'aunjolee@email.com', 8, 'MD, FACC');
INSERT INTO Doctors VALUES (3, 'Dr. fairuz anam', 'Endocrinologist', '123-555-7892', 'anuisthebest@email.com', 2, 'MD, FACE');
INSERT INTO Doctors VALUES (4, 'Dr. dalila alam', 'Internist', '123-555-7893', 'dalilasdesire@email.com', 19, 'MD');
INSERT INTO Doctors VALUES (5, 'Dr. mehjabinusha', 'General Practitioner', '123-555-7894', 'anuistherealanu@email.com', 20, 'MBBS');
INSERT INTO Doctors VALUES (6, 'Dr. reshawat hossain', 'Nephrologist', '123-555-7895', 'ummwhat@email.com', 7, 'MD');
INSERT INTO Doctors VALUES (7, 'Dr. yeanur islam', 'Cardiologist', '123-555-7896', 'tumiamkbolonakisu@email.com', 14, 'MD, FACC');
INSERT INTO Doctors VALUES (8, 'Dr. nuzhath kantomee', 'Endocrinologist', '123-555-7897', 'amrapibest@email.com', 18, 'MD, FACE');


ALTER TABLE Doctors DROP COLUMN email;

SELECT name, experience_years
FROM Doctors
WHERE experience_years < 10;


SELECT name
FROM Doctors
WHERE name LIKE 'Dr. a%';


SELECT * FROM Doctors;


CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    purpose TEXT,
    status VARCHAR(20),
    consultation_mode VARCHAR(20),
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
INSERT INTO Appointments VALUES (1, 1, 2, '2025-04-10', 'Routine check-up', 'Completed', 'In-Person', 'Vitals stable.');
INSERT INTO Appointments VALUES (2, 2, 1, '2025-04-12', 'Post-transplant follow-up', 'Completed', 'In-Person', 'Continue immunosuppressants.');
INSERT INTO Appointments VALUES (3, 3, 3, '2025-04-15', 'New patient consultation', 'Completed', 'Virtual', 'Advised blood tests.');
INSERT INTO Appointments VALUES (4, 4, 2, '2025-04-17', 'Dialysis review', 'Completed', 'In-Person', 'Mild cramping observed.');
INSERT INTO Appointments VALUES (5, 5, 4, '2025-04-19', 'Medication adjustment', 'Cancelled', 'In-Person', 'Patient did not show.');
INSERT INTO Appointments VALUES (6, 6, 1, '2025-04-21', 'Nutrition advice', 'Completed', 'Virtual', 'Diet chart provided.');
INSERT INTO Appointments VALUES (7, 7, 3, '2025-04-23', 'Lab report review', 'Completed', 'In-Person', 'Creatinine levels rising.');
INSERT INTO Appointments VALUES (8, 8, 4, '2025-04-25', 'Renal risk assessment', 'Scheduled', 'Virtual', 'Awaiting test results.');

SELECT * FROM Appointments
ORDER BY appointment_date DESC, status ASC;


SELECT * FROM Appointments;


CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    treatment_date DATE,
    treatment_type VARCHAR(100),
    description TEXT,
    outcome VARCHAR(100),
    medication_prescribed TEXT,
    next_followup_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Treatments VALUES (1, 1, 1, '2025-04-20', 'Dialysis','Routine dialysis session' , 'Stable', 'Erythropoietin', '2025-05-20');
INSERT INTO Treatments VALUES (2, 2, 2, '2025-04-15', 'Transplant Evaluation', 'Initial transplant assessment', 'Eligible', 'Tacrolimus advised', '2025-05-15');
INSERT INTO Treatments VALUES (3, 1, 1, '2025-04-18', 'Medication', 'Adjusted ACE inhibitors', 'Improved BP', 'Ramipril 5mg', '2025-05-18');
INSERT INTO Treatments VALUES (4, 2, 3, '2025-04-21', 'Transplant Evaluation', 'Further tests required', 'Pending', 'Awaiting clearance', '2025-05-21');
INSERT INTO Treatments VALUES (5, 3, 4, '2025-04-22', 'Follow-Up', 'Diet control', 'Maintaining', 'Low-protein diet', '2025-05-22');
INSERT INTO Treatments VALUES (6, 4, 2, '2025-04-23', 'Medication', 'Cardio consultation', 'Cleared for surgery', 'Metoprolol 50mg', '2025-05-23');
INSERT INTO Treatments VALUES (7, 5, 3, '2025-04-24', 'Dialysis', 'Emergency dialysis', 'Stable', 'Furosemide', '2025-05-24');
INSERT INTO Treatments VALUES (8, 6, 1, '2025-04-25', 'Nutrition', 'Adjusting diet for potassium control', 'Stable', 'None', '2025-05-25');

SELECT patient_id, COUNT(*) AS treatment_count
FROM Treatments
GROUP BY patient_id
HAVING COUNT(*) > 1;


SELECT * FROM Treatments;


CREATE TABLE Lab_Reports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    test_date DATE,
    creatinine DECIMAL(4,2),
    gfr DECIMAL(5,2),
    blood_pressure VARCHAR(20),
    hemoglobin DECIMAL(4,2),
    potassium DECIMAL(4,2),
    phosphorus DECIMAL(4,2),
    sodium DECIMAL(6,2),
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
INSERT INTO Lab_Reports VALUES (1, 1, '2025-04-15', 5.2, 18.5, '140/90', 11.5, 4.5, 5.0, 135, 'Stable condition');
INSERT INTO Lab_Reports VALUES (2, 2, '2025-04-10', 9.8, 9.5, '160/100', 9.0, 5.8, 6.0, 130, 'Severe renal failure');
INSERT INTO Lab_Reports VALUES (3, 3, '2025-04-12', 3.5, 42.0, '130/85', 12.3, 4.2, 4.8, 137, 'Moderate stage');
INSERT INTO Lab_Reports VALUES (4, 4, '2025-04-16', 1.2, 75.0, '120/80', 13.5, 3.8, 3.5, 138, 'Healthy kidney function');
INSERT INTO Lab_Reports VALUES (5, 5, '2025-04-18', 8.7, 12.5, '150/95', 10.0, 5.5, 5.5, 131, 'Near ESRD');
INSERT INTO Lab_Reports VALUES (6, 6, '2025-04-20', 0.9, 90.0, '115/75', 14.2, 3.9, 3.2, 140, 'Normal renal');
INSERT INTO Lab_Reports VALUES (7, 7, '2025-04-22', 4.0, 35.0, '135/85', 12.0, 4.7, 4.5, 136, 'Under observation');
INSERT INTO Lab_Reports VALUES (8, 8, '2025-04-23', 1.5, 70.0, '125/78', 13.2, 4.0, 4.0, 139, 'Stable');

SELECT * FROM Lab_Reports;

DROP TABLE IF EXISTS Lab_Reports;



CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    treatment_id INT,
    amount DECIMAL(10,2),
    bill_date DATE,
    paid_status VARCHAR(20),
    payment_mode VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

INSERT INTO Billing VALUES (1, 1, 1, 5000, '2025-04-20', 'Paid', 'Insurance');
INSERT INTO Billing VALUES (2, 2, 2, 15000, '2025-04-15', 'Unpaid', 'Cash');
INSERT INTO Billing VALUES (3, 3, 3, 3000, '2025-04-18', 'Paid', 'Credit Card');
INSERT INTO Billing VALUES (4, 4, 4, 18000, '2025-04-21', 'Unpaid', 'Insurance');
INSERT INTO Billing VALUES (5, 5, 5, 2500, '2025-04-22', 'Paid', 'Cash');
INSERT INTO Billing VALUES (6, 6, 6, 4000, '2025-04-23', 'Paid', 'Credit Card');
INSERT INTO Billing VALUES (7, 7, 7, 12000, '2025-04-25', 'Unpaid', 'Insurance');
INSERT INTO Billing VALUES (8, 8, 8, 7500, '2025-04-26', 'Paid', 'Cash');

SELECT * FROM Patients
WHERE patient_id NOT IN (SELECT patient_id FROM Billing WHERE paid_status = 'Paid');

SELECT SUM(amount) AS total_billing_amount FROM Billing;


SELECT * FROM Billing;



CREATE TABLE Dialysis_Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    session_date DATE,
    machine_id VARCHAR(10),
    duration_minutes INT,
    technician_name VARCHAR(100),
    complications TEXT,
    fluid_removed_ml INT,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
INSERT INTO Dialysis_Sessions VALUES (1, 1, '2025-04-01', 'MCH1001', 240, 'Tech takan', 'None', 2500, 'Completed');
INSERT INTO Dialysis_Sessions VALUES (2, 2, '2025-04-02', 'MCH1002', 235, 'Tech anu', 'Mild cramps', 2300, 'Completed');
INSERT INTO Dialysis_Sessions VALUES (3, 3, '2025-04-03', 'MCH1003', 245, 'Tech fairuz', 'Hypotension', 2600, 'Completed');
INSERT INTO Dialysis_Sessions VALUES (4, 4, '2025-04-04', 'MCH1004', 220, 'Tech dalala', 'None', 2200, 'Completed');
INSERT INTO Dialysis_Sessions VALUES (5, 5, '2025-04-05', 'MCH1001', 240, 'Tech knatom', 'Mild headache', 2550, 'Completed');
INSERT INTO Dialysis_Sessions VALUES (6, 6, '2025-04-06', 'MCH1002', 230, 'Tech rusho', 'None', 2400, 'Completed');
INSERT INTO Dialysis_Sessions VALUES (7, 7, '2025-04-07', 'MCH1003', 255, 'Tech bhugi', 'Fatigue', 2650, 'Completed');
INSERT INTO Dialysis_Sessions VALUES (8, 8, '2025-04-08', 'MCH1004', 250, 'Tech Sara', 'None', 2450, 'Completed');

update Dialysis_Sessions
  set machine_id='MCH100000' WHERE technician_name='Tech dalala';



SELECT * FROM Dialysis_Sessions;

CREATE TABLE Dialysis_Sessions_Copy AS
SELECT * FROM Dialysis_Sessions;

SELECT * FROM Dialysis_Sessions_Copy;


CREATE TABLE Medication_History (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    medication_name VARCHAR(100),
    dosage VARCHAR(50),
    start_date DATE,
    end_date DATE,
    prescribed_by INT,
    side_effects TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (prescribed_by) REFERENCES Doctors(doctor_id)
);
INSERT INTO Medication_History VALUES (1, 1, 'Tacrolimus', '50mg', '2025-04-01', '2025-05-01', 1, 'No significant side effects');
INSERT INTO Medication_History VALUES (2, 2, 'Furosemide', '20mg', '2025-04-05', '2025-05-05', 2, 'Mild dizziness');
INSERT INTO Medication_History VALUES (3, 3, 'Erythropoietin', '3000 IU', '2025-04-10', '2025-05-10', 3, 'Headache, nausea');
INSERT INTO Medication_History VALUES (4, 4, 'Metoprolol', '50mg', '2025-04-15', '2025-05-15', 4, 'Fatigue, low heart rate');
INSERT INTO Medication_History VALUES (5, 5, 'Vitamin D', '1000 IU', '2025-04-20', '2025-05-20', 5, 'No side effects');
INSERT INTO Medication_History VALUES (6, 6, 'Ramipril', '5mg', '2025-04-25', '2025-05-25', 6, 'Cough, dizziness');
INSERT INTO Medication_History VALUES (7, 7, 'Calcium Carbonate', '500mg', '2025-04-30', '2025-05-30', 7, 'Constipation, bloating');
INSERT INTO Medication_History VALUES (8, 8, 'Erythropoietin', '2000 IU', '2025-05-01', '2025-06-01', 8, 'No side effects');

SELECT * FROM Medication_History
WHERE medication_name = (
    SELECT medication_name 
    FROM Medication_History 
    WHERE patient_id = 3
);


SELECT * FROM Medication_History;


CREATE TABLE Transplant_History (
    transplant_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    donor_type VARCHAR(50),
    donor_relation VARCHAR(100),
    transplant_date DATE,
    hospital_name VARCHAR(100),
    rejection_incidents INT,
    immunosuppressant_therapy TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Transplant_History VALUES (1, 1, 'Living Donor', 'Brother', '2025-03-01', 'City Hospital', 0, 'Tacrolimus, Mycophenolate Mofetil');
INSERT INTO Transplant_History VALUES (2, 2, 'Deceased Donor', 'N/A', '2025-03-05', 'Regional Hospital', 1, 'Tacrolimus, Azathioprine');
INSERT INTO Transplant_History VALUES (3, 3, 'Living Donor', 'Father', '2025-03-10', 'Metro Hospital', 0, 'Sirolimus, Prednisone');
INSERT INTO Transplant_History VALUES (4, 4, 'Living Donor', 'Wife', '2025-03-15', 'National Hospital', 0, 'Tacrolimus, Prednisone');
INSERT INTO Transplant_History VALUES (5, 5, 'Deceased Donor', 'N/A', '2025-03-20', 'General Hospital', 0, 'Mycophenolate Mofetil, Prednisone');
INSERT INTO Transplant_History VALUES (6, 6, 'Living Donor', 'Sister', '2025-03-25', 'Community Hospital', 0, 'Tacrolimus, Mycophenolate Mofetil');
INSERT INTO Transplant_History VALUES (7, 7, 'Living Donor', 'Uncle', '2025-03-30', 'City Hospital', 0, 'Sirolimus, Azathioprine');
INSERT INTO Transplant_History VALUES (8, 8, 'Deceased Donor', 'N/A', '2025-04-01', 'Metro Hospital', 1, 'Tacrolimus, Mycophenolate Mofetil');

SELECT donor_type, COUNT(*) AS total_transplants
FROM Transplant_History
GROUP BY donor_type;


SELECT * FROM Transplant_History;


CREATE TABLE Nutrition_Consultations (
    consultation_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    consult_date DATE,
    dietitian_name VARCHAR(100),
    nutrition_plan TEXT,
    recommendations TEXT,
    followup_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Nutrition_Consultations VALUES (1, 1, '2025-03-01', 'munira mustarin', 'Low-protein diet for renal health', 'Increase water intake, reduce sodium', '2025-04-01');
INSERT INTO Nutrition_Consultations VALUES (2, 2, '2025-03-05', 'shanjida neela', 'Renal disease management diet', 'Increase potassium-rich foods, reduce phosphorus', '2025-04-05');
INSERT INTO Nutrition_Consultations VALUES (3, 3, '2025-03-10', 'tanjida muna', 'Diabetic kidney disease diet', 'Moderate protein intake, limit sugar', '2025-04-10');
INSERT INTO Nutrition_Consultations VALUES (4, 4, '2025-03-15', 'shameem sadat', 'High-fiber renal diet', 'Increase fiber, avoid processed foods', '2025-04-15');
INSERT INTO Nutrition_Consultations VALUES (5, 5, '2025-03-20', 'mikail hossain', 'Low-salt kidney diet', 'Reduce sodium, focus on fresh vegetables', '2025-04-20');
INSERT INTO Nutrition_Consultations VALUES (6, 6, '2025-03-25', 'akash neerjhor', 'Heart-healthy renal diet', 'Increase omega-3 intake, limit saturated fats', '2025-04-25');
INSERT INTO Nutrition_Consultations VALUES (7, 7, '2025-03-30', 'reshawat hossain', 'Renal transplant diet', 'Avoid high-calcium foods, take vitamins as prescribed', '2025-04-30');
INSERT INTO Nutrition_Consultations VALUES (8, 8, '2025-04-01', 'anika kader', 'General kidney health diet', 'Increase antioxidants, stay hydrated', '2025-05-01');

SELECT * FROM Nutrition_Consultations
WHERE followup_date BETWEEN '2025-04-01' AND '2025-04-30';


SELECT * FROM Nutrition_Consultations;


CREATE TABLE Kidney_Biopsy_Reports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    biopsy_date DATE,
    pathologist_name VARCHAR(100),
    findings TEXT,
    diagnosis TEXT,
    recommendations TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Kidney_Biopsy_Reports VALUES (1, 1, '2025-03-01', 'Dr. Aunjolee', 'Minimal fibrosis, mild inflammation', 'Chronic glomerulonephritis', 'Start immunosuppressive therapy');
INSERT INTO Kidney_Biopsy_Reports VALUES (2, 2, '2025-03-05', 'Dr. Nusrath', 'Moderate scarring, mild cellular infiltration', 'Focal segmental glomerulosclerosis', 'Monitor GFR, adjust medication');
INSERT INTO Kidney_Biopsy_Reports VALUES (3, 3, '2025-03-10', 'Dr. Anu', 'No significant abnormalities', 'Normal kidney tissue', 'Continue current treatment');
INSERT INTO Kidney_Biopsy_Reports VALUES (4, 4, '2025-03-15', 'Dr. Nuzhath', 'Severe glomerular damage, moderate fibrosis', 'IgA nephropathy', 'Consider a renal transplant evaluation');
INSERT INTO Kidney_Biopsy_Reports VALUES (5, 5, '2025-03-20', 'Dr. Tasnim', 'Minimal changes, mild proteinuria', 'Minimal change disease', 'Review medication dosage');
INSERT INTO Kidney_Biopsy_Reports VALUES (6, 6, '2025-03-25', 'Dr. Kantomee', 'Patchy inflammation, some fibrosis', 'Diabetic nephropathy', 'Aggressive blood sugar management');
INSERT INTO Kidney_Biopsy_Reports VALUES (7, 7, '2025-03-30', 'Dr. Faiz', 'Severe tubular atrophy, advanced fibrosis', 'Chronic kidney disease stage 3', 'Evaluate dialysis options');
INSERT INTO Kidney_Biopsy_Reports VALUES (8, 8, '2025-04-01', 'Dr. Ahmed', 'Mild mesangial expansion, no fibrosis', 'Hypertensive nephropathy', 'Tighten blood pressure control');

SELECT 
    report_id,
    patient_id,
    biopsy_date,
    pathologist_name,
    findings,
    diagnosis,
    recommendations,
    CASE 
        WHEN findings LIKE '%severe%' THEN 'High Severity'
        WHEN findings LIKE '%moderate%' THEN 'Moderate Severity'
        WHEN findings LIKE '%mild%' THEN 'Low Severity'
        WHEN findings LIKE '%no significant abnormalities%' THEN 'Normal'
        ELSE 'Uncategorized'
    END AS severity_level
FROM Kidney_Biopsy_Reports;


SELECT * FROM Kidney_Biopsy_Reports;


CREATE TABLE Renal_Risk_Assessments (
    risk_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    assessment_date DATE,
    gfr_score DECIMAL(5,2),
    creatinine_level DECIMAL(4,2),
    proteinuria_level VARCHAR(50),
    risk_score INT CHECK (risk_score BETWEEN 0 AND 100),
    risk_category VARCHAR(20),
    recommended_action TEXT,
    assessed_by VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Renal_Risk_Assessments VALUES (1, 1, '2025-03-01', 45.50, 1.20, 'Negative', 10, 'Low Risk', 'Increase fluid intake, continue monitoring', 'Dr. Emily Smith');
INSERT INTO Renal_Risk_Assessments VALUES (2, 2, '2025-03-05', 35.20, 1.60, 'Positive', 20, 'Moderate Risk', 'Limit salt intake, review medication', 'Dr. deepika padukone');
INSERT INTO Renal_Risk_Assessments VALUES (3, 3, '2025-03-10', 50.00, 0.90, 'Negative', 8, 'Low Risk', 'Encourage regular check-ups', 'Dr. ian somerholder');
INSERT INTO Renal_Risk_Assessments VALUES (4, 4, '2025-03-15', 40.75, 1.50, 'Negative', 15, 'Low Risk', 'Continue regular medication', 'Dr. jhoney depp');
INSERT INTO Renal_Risk_Assessments VALUES (5, 5, '2025-03-20', 38.30, 1.70, 'Positive', 30, 'High Risk', 'Consider early dialysis evaluation', 'Dr. robert downey jr');
INSERT INTO Renal_Risk_Assessments VALUES (6, 6, '2025-03-25', 42.50, 1.10, 'Negative', 12, 'Low Risk', 'Maintain current lifestyle', 'Dr. chris hemsworth');
INSERT INTO Renal_Risk_Assessments VALUES (7, 7, '2025-03-30', 41.60, 1.80, 'Positive', 18, 'Moderate Risk', 'Control hypertension, monitor kidney function', 'Dr. Laura Green');
INSERT INTO Renal_Risk_Assessments VALUES (8, 8, '2025-04-01', 44.20, 1.40, 'Negative', 10, 'Low Risk', 'Maintain low-sodium diet', 'Dr. Kevin Blue');

SELECT 
    patient_id,
    assessment_date,
    gfr_score,
    risk_score,
    risk_category,
    CASE 
        WHEN risk_score BETWEEN 0 AND 10 THEN 'Excellent kidney function'
        WHEN risk_score BETWEEN 11 AND 20 THEN 'Monitor regularly'
        WHEN risk_score BETWEEN 21 AND 30 THEN 'Immediate medical attention advised'
        ELSE 'Critical condition – urgent dialysis review'
    END AS risk_message
FROM Renal_Risk_Assessments;


SELECT * FROM Renal_Risk_Assessments;

