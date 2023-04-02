DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
\c hospital_db



CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialty TEXT NOT NULL
);



CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL,
    treatment TEXT 

);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY,
    name TEXT  NOT NULL,
    phone INT   NOT NULL,
    address TEXT  NOT NULL
);

CREATE TABLE treatment_visit 
(
    id SERIAL PRIMARY KEY,
    patientID int   REFERENCES patients,
    doctorID int   REFERENCES doctors,
    disease1_ID int   REFERENCES diseases,
    disease2_ID int   REFERENCES diseases,
    disease3_ID int   REFERENCES diseases,
    disease4_ID int   REFERENCES diseases,
    disease5_ID int   REFERENCES diseases
);



