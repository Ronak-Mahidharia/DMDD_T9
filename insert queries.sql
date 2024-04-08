use PATIENT_MANAGEMENT;

INSERT INTO Patient (First_Name, Last_Name, DOB, Gender, Address, Phone_Number, Email) 
VALUES 
('John', 'Doe', '1985-03-15', 'M', '123 Main St, Anytown', '555-123-4567', 'john.doe@example.com'),
('Jane', 'Smith', '1990-07-25', 'F', '456 Elm St, Newtown', '555-987-6543', 'jane.smith@example.com'),
('Michael', 'Johnson', '1976-11-10', 'M', '789 Oak St, Springfield', '555-555-5555', 'michael.johnson@example.com'),
('Emily', 'Williams', '1988-05-20', 'F', '101 Pine St, Lakeside', '555-222-3333', 'emily.williams@example.com'),
('David', 'Brown', '1982-09-30', 'M', '222 Maple St, Riverside', '555-777-8888', 'david.brown@example.com'),
('Sarah', 'Jones', '1970-12-05', 'F', '333 Cedar St, Hillside', '555-444-9999', 'sarah.jones@example.com'),
('Christopher', 'Davis', '1995-02-18', 'M', '444 Birch St, Mountainside', '555-666-1111', 'christopher.davis@example.com'),
('Jessica', 'Miller', '1983-08-12', 'F', '555 Walnut St, Valleyview', '555-111-2222', 'jessica.miller@example.com'),
('Matthew', 'Wilson', '1978-06-28', 'M', '666 Cherry St, Lakeshore', '555-999-3333', 'matthew.wilson@example.com'),
('Amanda', 'Taylor', '1992-04-17', 'F', '777 Pineapple St, Beachside', '555-333-4444', 'amanda.taylor@example.com'),
('James', 'Anderson', '1980-10-08', 'M', '888 Banana St, Countryside', '555-444-5555', 'james.anderson@example.com'),
('Ashley', 'Martinez', '1986-03-22', 'F', '999 Grape St, Riverside', '555-888-7777', 'ashley.martinez@example.com'),
('Daniel', 'Hernandez', '1974-09-14', 'M', '111 Peach St, Hilltop', '555-222-1111', 'daniel.hernandez@example.com'),
('Melissa', 'Garcia', '1998-11-30', 'F', '222 Mango St, Seaside', '555-777-9999', 'melissa.garcia@example.com'),
('Ryan', 'Lopez', '1989-07-07', 'M', '333 Kiwi St, Lakeside', '555-666-5555', 'ryan.lopez@example.com'),
('Kimberly', 'Gonzalez', '1981-05-25', 'F', '444 Coconut St, Mountainside', '555-444-2222', 'kimberly.gonzalez@example.com'),
('Eric', 'Perez', '1977-01-19', 'M', '555 Watermelon St, Countryside', '555-999-6666', 'eric.perez@example.com'),
('Nicole', 'Rodriguez', '1991-08-03', 'F', '666 Papaya St, Riverside', '555-333-7777', 'nicole.rodriguez@example.com'),
('Jason', 'Ramirez', '1979-04-12', 'M', '777 Plum St, Hilltop', '555-888-2222', 'jason.ramirez@example.com'),
('Michelle', 'Sanchez', '1984-12-28', 'F', '888 Orange St, Seaside', '555-111-8888', 'michelle.sanchez@example.com');


select * from  Patient;
-----


INSERT INTO Doctor (First_Name, Last_Name, Phone_Number, Specialization, Email_ID) 
VALUES 
('John', 'Smith', '555-123-4567', 'Cardiology', 'john.smith@example.com'),
('Emily', 'Johnson', '555-234-5678', 'Pediatrics', 'emily.johnson@example.com'),
('Michael', 'Williams', '555-345-6789', 'Orthopedics', 'michael.williams@example.com'),
('Jessica', 'Brown', '555-456-7890', 'Dermatology', 'jessica.brown@example.com'),
('David', 'Miller', '555-567-8901', 'Neurology', 'david.miller@example.com'),
('Sarah', 'Davis', '555-678-9012', 'Oncology', 'sarah.davis@example.com'),
('Matthew', 'Martinez', '555-789-0123', 'Psychiatry', 'matthew.martinez@example.com'),
('Amanda', 'Garcia', '555-890-1234', 'Gynecology', 'amanda.garcia@example.com'),
('James', 'Hernandez', '555-901-2345', 'Urology', 'james.hernandez@example.com'),
('Ashley', 'Lopez', '555-012-3456', 'ENT (Otorhinolaryngology)', 'ashley.lopez@example.com');

select * from doctor;

------]

-- Insert data into the Appointment table
INSERT INTO Appointment (Patient_ID, Doctor_ID, Appointment_Date, Purpose, Status)
VALUES 

(1, 1, '2024-04-10', 'Regular checkup', 'Incomplete'),
(2, 2, '2023-04-12', 'Vaccination', 'Incomplete'),
(3, 3, '2022-04-15', 'Follow-up', 'Incomplete'),
(4, 4, '2021-04-18', 'Skin condition', 'Scheduled'),
(5, 5, '2023-04-20', 'Headache', 'Incomplete'),
(6, 6, '2024-04-22', 'Chemotherapy', 'Incomplete'),
(7, 7, '2024-04-25', 'Therapy session', 'Scheduled'),
(8, 8, '2024-04-28', 'Annual checkup', 'Completed'),
(9, 9, '2021-04-30', 'Consultation', 'Completed'),
(10, 10, '2023-05-02', 'Ear pain', 'Completed'),
(11, 3, '2022-05-05', 'Chest pain', 'Incomplete'),
(12, 2, '2024-05-08', 'Flu symptoms', 'Completed'),
(13, 4, '2022-05-10', 'X-ray', 'Incomplete'),
(14, 4, '2024-05-12', 'Biopsy', 'Incomplete'),
(15, 5, '2024-05-15', 'Migraine', 'Completed'),
(16, 6, '2024-05-18', 'Psychiatric evaluation', 'Completed'),
(17, 3, '2024-05-20', 'Counseling', 'Scheduled'),
(18, 8, '2024-05-22', 'Pap smear', 'Completed'),
(19, 8, '2023-05-25', 'Prostate exam', 'Incomplete'),
(20, 10, '2024-05-28', 'Tonsillectomy', 'Scheduled'),
(1, 7, '2021-05-31', 'Annual checkup', 'Scheduled'),
(2, 4, '2024-06-03', 'X-ray', 'Completed'),
(3, 4, '2021-06-06', 'Skin condition', 'Incomplete'),
(4, 2, '2021-06-09', 'Regular checkup', 'Completed'),
(5, 6, '2021-06-12', 'Regular checkup', 'Scheduled'),
(6, 10, '2022-06-15', 'Regular checkup', 'Completed'),
(7, 5, '2022-06-18', 'Skin condition', 'Completed'),
(8, 3, '2022-06-21', 'Tonsillectomy', 'Completed'),
(9, 2, '2022-06-24', 'Chest pain', 'Scheduled'),
(10, 4, '2022-06-27', 'X-ray', 'Completed');


select * from Appointment;

-- drop table Appointment
-- drop table Appointment;

-----


-- Add 20 rows in the Insurance table
INSERT INTO Insurance (Patient_ID, Policy_Number, Company_Name, Coverage_Details, Validity_Period)
VALUES 
(1, 'POL-001', 'ABC Insurance', 'Health, Dental', '2024-12-31'),
(2, 'POL-002', 'XYZ Insurance', 'Health, Vision', '2024-11-30'),
(3, 'POL-003', 'DEF Insurance', 'Health, Dental, Vision', '2024-10-31'),
(4, 'POL-004', 'GHI Insurance', 'Health', '2024-09-30'),
(5, 'POL-005', 'JKL Insurance', 'Dental, Vision', '2024-08-31'),
(6, 'POL-006', 'MNO Insurance', 'Health, Dental', '2024-07-31'),
(7, 'POL-007', 'PQR Insurance', 'Health, Vision', '2024-06-30'),
(8, 'POL-008', 'STU Insurance', 'Health, Dental', '2024-05-31'),
(9, 'POL-009', 'VWX Insurance', 'Vision', '2024-04-30'),
(10, 'POL-010', 'YZA Insurance', 'Health, Dental, Vision', '2024-04-30'), -- Corrected date
(11, 'POL-011', 'BCD Insurance', 'Health, Dental', '2024-05-29'),
(12, 'POL-012', 'EFG Insurance', 'Vision', '2024-07-31'),
(13, 'POL-013', 'HIJ Insurance', 'Health, Dental, Vision', '2026-12-31'),
(14, 'POL-014', 'KLM Insurance', 'Health, Dental', '2025-11-30'),
(15, 'POL-015', 'NOP Insurance', 'Health, Vision', '2025-10-31'),
(16, 'POL-016', 'QRS Insurance', 'Dental, Vision', '2024-09-30'),
(17, 'POL-017', 'TUV Insurance', 'Health, Dental', '2026-08-31'),
(18, 'POL-018', 'VWX Insurance', 'Health', '2026-07-31'),
(19, 'POL-019', 'YZA Insurance', 'Health, Dental, Vision', '2027-06-30'),
(20, 'POL-020', 'BCD Insurance', 'Vision', '2024-05-31');


select * from Insurance;

-----

-- Inserting 20 records into the Medical_History table
INSERT INTO Medical_History (Patient_ID, Doctor_ID, History_Type)
VALUES 
-- Randomly assign patient-doctor pairs and history types
(1, 1, 'General Checkup'),
(2, 2, 'Allergy Consultation'),
(3, 3, 'Orthopedic Evaluation'),
(4, 4, 'Dermatology Checkup'),
(5, 5, 'Neurology Consultation'),
(6, 6, 'Oncology Screening'),
(7, 7, 'Psychiatry Assessment'),
(8, 8, 'Gynecology Consultation'),
(9, 9, 'Urology Exam'),
(10, 10, 'ENT Evaluation'),
(11, 1, 'Cardiology Consultation'),
(12, 2, 'Pediatric Checkup'),
(13, 3, 'Dental Exam'),
(14, 4, 'Vision Screening'),
(15, 5, 'Allergy Testing'),
(16, 6, 'Dermatology Consultation'),
(17, 7, 'Neurology Evaluation'),
(18, 8, 'Orthopedic Consultation'),
(19, 9, 'Psychiatry Consultation'),
(20, 10, 'Gynecology Exam');

select * from Medical_History;

-------

-- Inserting 20 records into the Prescription table
INSERT INTO Prescription (Record_ID)
VALUES 
(1), (5), (5), (7), (9), 
(11), (13), (15), (17), (19), 
(2), (3), (5), (7), (12), 
(13), (3), (5), (4), (10);




-----

-- Inserting 20 records into the Medicine table
INSERT INTO Medicine (Description, Name, Possible_Side_Effect)
VALUES 
('Antibiotic used to treat bacterial infections', 'Amoxicillin', 'Nausea, diarrhea'),
('Pain reliever and fever reducer', 'Ibuprofen', 'Stomach irritation'),
('Anti-inflammatory drug', 'Prednisone', 'Weight gain, mood changes'),
('Antihistamine used for allergies', 'Loratadine', 'Drowsiness, dry mouth'),
('Antidepressant medication', 'Sertraline', 'Insomnia, headache'),
('Antacid used for heartburn relief', 'Ranitidine', 'Dizziness, constipation'),
('Medication for high blood pressure', 'Lisinopril', 'Cough, dizziness'),
('Blood thinner to prevent clotting', 'Warfarin', 'Bleeding, bruising'),
('Diuretic to treat fluid retention', 'Furosemide', 'Dehydration, muscle cramps'),
('Insulin used to control blood sugar', 'Insulin glargine', 'Hypoglycemia, weight gain'),
('Anti-anxiety medication', 'Alprazolam', 'Drowsiness, confusion'),
('Medication for acid reflux', 'Omeprazole', 'Headache, diarrhea'),
('Bronchodilator for asthma', 'Albuterol', 'Tremor, palpitations'),
('Antiviral drug used for influenza', 'Oseltamivir', 'Nausea, vomiting'),
('Anticonvulsant medication', 'Gabapentin', 'Dizziness, drowsiness'),
('Antiemetic used to prevent nausea', 'Ondansetron', 'Headache, constipation'),
('Thyroid hormone replacement', 'Levothyroxine', 'Hair loss, weight changes'),
('Medication for erectile dysfunction', 'Sildenafil', 'Headache, flushing'),
('Antifungal medication', 'Fluconazole', 'Nausea, abdominal pain'),
('Muscle relaxant for spasms', 'Cyclobenzaprine', 'Drowsiness, dry mouth');


select * from Medicine;


------------

-- Inserting 20 records into the PrescriptionMedicine table
INSERT INTO PrescriptionMedicine (Prescription_ID, Medicine_ID, Dosage, Frequency, Duration)
VALUES 
(1, 1, '500mg', 'Twice daily', '7 days'),
(1, 2, '200mg', 'As needed', '3 days'),
(2, 3, '10mg', 'Once daily', '14 days'),
(2, 4, '10mg', 'Once daily at bedtime', '30 days'),
(3, 5, '50mg', 'Twice daily', '10 days'),
(3, 6, '150mg', 'Once daily', '30 days'),
(4, 7, '20mg', 'Once daily', '7 days'),
(4, 8, '5mg', 'Once daily', '30 days'),
(5, 9, '40mg', 'Once daily', '14 days'),
(5, 10, '10 units', 'Before meals', '30 days'),
(6, 11, '0.5mg', 'Twice daily', '14 days'),
(6, 12, '20mg', 'Once daily', '30 days'),
(7, 13, '75mg', 'Twice daily', '10 days'),
(7, 14, '75mg', 'Twice daily', '5 days'),
(8, 15, '300mg', 'Once daily', '14 days'),
(8, 16, '4mg', 'As needed', '3 days'),
(9, 17, '100mcg', 'Once daily', '30 days'),
(9, 18, '50mg', 'Before activity', '4 hours'),
(10, 19, '150mg', 'As needed', '7 days'),
(10, 20, '10mg', 'Twice daily', '14 days');


select * from PrescriptionMedicine;

--------

-- Inserting 20 rows into the Vaccine table
INSERT INTO Vaccine (Description, Name)
VALUES 
('Prevents measles, mumps, and rubella', 'MMR'),
('Prevents hepatitis B virus infection', 'Hepatitis B'),
('Prevents diphtheria, tetanus, and pertussis', 'DTaP'),
('Prevents polio virus infection', 'Polio'),
('Prevents Haemophilus influenzae type b infection', 'Hib'),
('Prevents pneumococcal disease', 'Pneumococcal'),
('Prevents rotavirus infection', 'Rotavirus'),
('Prevents influenza virus infection', 'Influenza'),
('Prevents chickenpox', 'Varicella'),
('Prevents meningococcal disease', 'Meningococcal'),
('Prevents human papillomavirus infection', 'HPV'),
('Prevents shingles', 'Herpes Zoster'),
('Prevents hepatitis A virus infection', 'Hepatitis A'),
('Prevents typhoid fever', 'Typhoid'),
('Prevents yellow fever', 'Yellow Fever'),
('Prevents rabies', 'Rabies'),
('Prevents Japanese encephalitis', 'Japanese Encephalitis'),
('Prevents tick-borne encephalitis', 'Tick-Borne Encephalitis'),
('Prevents cholera', 'Cholera'),
('Prevents tuberculosis', 'Tuberculosis');


select * from Vaccine;


-----

-- Inserting rows into the Disease table
INSERT INTO Disease (Disease_ID, Name, Description)
VALUES 
(1, 'Influenza', 'A viral infection that affects the respiratory system, causing fever, cough, sore throat, and muscle aches.'),
(2, 'Diabetes', 'A chronic condition that affects how your body processes glucose (sugar) in your blood.'),
(3, 'Hypertension', 'A condition in which the force of the blood against the artery walls is too high.'),
(4, 'Asthma', 'A chronic respiratory condition characterized by difficulty breathing and wheezing.'),
(5, 'Arthritis', 'A joint disorder causing inflammation, pain, and stiffness.'),
(6, 'Alzheimers Disease', 'A progressive disorder that causes brain cells to degenerate and die, leading to memory loss and cognitive decline.'),
(7, 'Cancer', 'A group of diseases characterized by abnormal cell growth with the potential to invade or spread to other parts of the body.'),
(8, 'Chronic Obstructive Pulmonary Disease (COPD)', 'A group of lung diseases that block airflow and make breathing difficult.'),
(9, 'Heart Disease', 'A range of conditions that affect your heart, including coronary artery disease, heart attack, and heart failure.'),
(10, 'Stroke', 'A medical emergency that occurs when blood flow to the brain is interrupted or reduced, causing brain tissue to die.'),
(11, 'Osteoporosis', 'A condition characterized by fragile bones that are more susceptible to fractures.'),
(12, 'Depression', 'A mood disorder that causes persistent feelings of sadness and loss of interest in activities.'),
(13, 'Epilepsy', 'A neurological disorder characterized by recurrent seizures.'),
(14, 'Parkinsons Disease', 'A progressive nervous system disorder that affects movement.'),
(15, 'Chronic Kidney Disease', 'A condition in which kidney function gradually declines over time.'),
(16, 'Gastroesophageal Reflux Disease (GERD)', 'A digestive disorder that occurs when stomach acid frequently flows back into the esophagus.'),
(17, 'Migraine', 'A type of headache characterized by severe throbbing pain, usually on one side of the head.'),
(18, 'Anemia', 'A condition in which you lack enough healthy red blood cells to carry adequate oxygen to your bodys tissues.'),
(19, 'Obesity', 'A medical condition characterized by excessive body fat that increases the risk of other health problems.'),
(20, 'Rheumatoid Arthritis', 'An autoimmune disorder that causes inflammation in the joints.');

select * from Disease;


-------


-- Inserting data into the PatientAllergy table
INSERT INTO PatientAllergy (Allergy_ID, Patient_ID, Note)
VALUES 
(1, 1, 'Allergic to peanuts.'),
(2, 2, 'Allergic to shellfish.'),
(3, 3, 'Allergic to pollen.'),
(4, 4, 'Allergic to penicillin.'),
(5, 5, 'Allergic to dust mites.'),
(6, 6, 'Allergic to pet dander.'),
(7, 7, 'Allergic to latex.'),
(8, 8, 'Allergic to bee stings.'),
(9, 9, 'Allergic to certain medications.'),
(10, 10, 'Allergic to dairy products.'),
(11, 11, 'Allergic to soy.'),
(12, 12, 'Allergic to eggs.'),
(13, 13, 'Allergic to wheat.'),
(14, 14, 'Allergic to mold.'),
(15, 15, 'Allergic to grass.'),
(16, 16, 'Allergic to certain fruits.'),
(17, 17, 'Allergic to certain nuts.'),
(18, 18, 'Allergic to seafood.'),
(19, 19, 'Allergic to certain food additives.'),
(20, 20, 'Allergic to certain preservatives.');

select * from PatientAllergy;


-----

-- Inserting data into the Allergy table
INSERT INTO Allergy (Name, Medication)
VALUES 
('Peanuts', 'Epinephrine'),
('Shellfish', 'Antihistamines'),
('Pollen', 'Nasal corticosteroids'),
('Penicillin', 'Antibiotics alternative'),
('Dust Mites', 'Decongestants'),
('Pet Dander', 'Bronchodilators'),
('Latex', 'Corticosteroids'),
('Bee Stings', 'Epinephrine auto-injector'),
('Medications', 'Desensitization therapy'),
('Dairy Products', 'Antihistamines'),
('Soy', 'Epinephrine'),
('Eggs', 'Nasal corticosteroids'),
('Wheat', 'Antibiotics alternative'),
('Mold', 'Decongestants'),
('Grass', 'Bronchodilators'),
('Fruits', 'Corticosteroids'),
('Nuts', 'Epinephrine auto-injector'),
('Seafood', 'Desensitization therapy'),
('Food Additives', 'Antihistamines'),
('Preservatives', 'Nasal corticosteroids');


select * from Allergy;

-------


-- Inserting data into the PatientGeneralHistory table
INSERT INTO PatientGeneralHistory (PGRecord_ID, Date_Of_Visit, Doctor_Note)
VALUES 
(1, '2023-05-10', 'Patient presented with flu-like symptoms. Prescribed rest and fluids.'),
(2, '2023-06-15', 'Patient complained of chest pain. Referred for further cardiac evaluation.'),
(3, '2023-07-20', 'Patient visited for routine checkup. No significant issues observed.'),
(4, '2023-08-25', 'Patient reported shortness of breath. Referred to pulmonologist for evaluation.'),
(5, '2023-09-30', 'Patient presented with symptoms of gastroesophageal reflux. Prescribed antacids.'),
(6, '2023-10-05', 'Patient visited for annual physical examination. No concerns noted.'),
(7, '2023-11-10', 'Patient complained of joint pain. Referred to rheumatologist for further assessment.'),
(8, '2023-12-15', 'Patient visited for follow-up after surgery. Wound healing progressing well.'),
(9, '2024-01-20', 'Patient reported symptoms of depression. Started on antidepressant medication.'),
(10, '2024-02-25', 'Patient presented with symptoms of anxiety. Counseling provided.'),
(11, '2024-03-30', 'Patient visited for routine diabetic checkup. Blood glucose levels stable.'),
(12, '2024-04-05', 'Patient reported recurrent headaches. Referred to neurologist for evaluation.'),
(13, '2024-05-10', 'Patient presented with symptoms of allergic reaction. Prescribed antihistamines.'),
(14, '2024-06-15', 'Patient visited for follow-up after hospitalization. Recovery progressing well.'),
(15, '2024-07-20', 'Patient reported symptoms of urinary tract infection. Started on antibiotics.'),
(16, '2024-08-25', 'Patient visited for routine blood pressure monitoring. Levels within normal range.'),
(17, '2024-09-30', 'Patient complained of back pain. Referred to orthopedic specialist.'),
(18, '2024-10-05', 'Patient visited for routine checkup. No significant issues noted.'),
(19, '2024-11-10', 'Patient presented with symptoms of seasonal allergies. Prescribed nasal corticosteroids.'),
(20, '2024-12-15', 'Patient reported symptoms of acid reflux. Prescribed proton pump inhibitors.');


select * from PatientGeneralHistory;


-------

-- Inserting data into the PatientDiseasesHistory table
INSERT INTO PatientDiseasesHistory (PDRecord_ID, Disease_ID, Symptoms)
VALUES 
(1, 1, 'Fever, cough, sore throat'),
(2, 2, 'Increased thirst, frequent urination, fatigue'),
(3, 3, 'Headache, dizziness, blurred vision'),
(4, 4, 'Wheezing, shortness of breath, chest tightness'),
(5, 5, 'Joint pain, stiffness, swelling'),
(6, 6, 'Memory loss, confusion, difficulty performing familiar tasks'),
(7, 7, 'Unexplained weight loss, persistent fatigue, lump or swelling'),
(8, 3, 'Headache, dizziness, blurred vision'),
(9, 1, 'Fever, cough, sore throats'),
(10, 1, 'Sudden numbness or weakness, trouble speaking, confusion'),
(11, 11, 'Back pain, bone fractures, loss of height'),
(12, 12, 'Persistent sadness, loss of interest or pleasure, changes in appetite'),
(13, 3, 'Headache, dizziness, blurred vision'),
(14, 5, 'Tremors, stiffness, slowness of movement'),
(15, 3, 'Fatigue, weakness, swelling of ankles and legs'),
(16, 16, 'Heartburn, chest pain, difficulty swallowing'),
(17, 1, 'Fever, cough, sore throat'),
(18, 9, 'Fatigue, weakness, pale or yellowish skin'),
(19, 10, 'Shortness of breath, snoring, high blood pressure'),
(20, 5, 'Joint pain, stiffness, swelling');



select * from PatientDiseasesHistory;


--------


-- Inserting data into the PatientVaccineHistory table
INSERT INTO PatientVaccineHistory (PVRecord_ID, Vaccine_ID, Date_Of_Vaccination)
VALUES 
(1, 1, '2023-01-15'),
(2, 2, '2023-03-20'),
(3, 3, '2023-05-25'),
(4, 4, '2023-07-30'),
(5, 5, '2023-09-05'),
(6, 6, '2023-11-10'),
(7, 7, '2024-01-15'),
(8, 8, '2024-03-20'),
(9, 9, '2024-05-25'),
(10, 10, '2024-07-30'),
(11, 11, '2024-09-05'),
(12, 12, '2024-11-10'),
(13, 13, '2025-01-15'),
(14, 14, '2025-03-20'),
(15, 15, '2025-05-25'),
(16, 16, '2025-07-30'),
(17, 17, '2025-09-05'),
(18, 18, '2025-11-10'),
(19, 19, '2026-01-15'),
(20, 20, '2026-03-20');


select * from PatientVaccineHistory;


-------


-- Inserting data into the Family table
INSERT INTO Family (Patient_ID, Relative_Name, Relative_Relation)
VALUES 
(1, 'Mary Doe', 'Spouse'),
(1, 'Tommy Doe', 'Child'),
(2, 'Robert Smith', 'Spouse'),
(2, 'Sarah Smith', 'Child'),
(3, 'Jennifer Johnson', 'Spouse'),
(3, 'Emily Johnson', 'Child'),
(4, 'Daniel Williams', 'Spouse'),
(4, 'Sophia Williams', 'Child'),
(5, 'Jessica Brown', 'Spouse'),
(5, 'Olivia Brown', 'Child'),
(6, 'Christopher Davis', 'Spouse'),
(6, 'Emma Davis', 'Child'),
(7, 'Ashley Martinez', 'Spouse'),
(7, 'Isabella Martinez', 'Child'),
(8, 'David Garcia', 'Spouse'),
(8, 'Charlotte Garcia', 'Child'),
(9, 'Michael Hernandez', 'Spouse'),
(9, 'Amelia Hernandez', 'Child'),
(10, 'Amanda Lopez', 'Spouse'),
(10, 'Ethan Lopez', 'Child');


select * from Family;