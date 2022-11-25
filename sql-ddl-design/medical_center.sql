DROP DATABASE IF EXISTS  medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    billind_address TEXT NOT NULL,
    insurance TEXT NOT NULL
);

CREATE TABLE specialties (
    id SERIAL PRIMARY KEY,
    medical_specialty TEXT NOT NULL
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    medical_specialty INTEGER REFERENCES Specialties (id) NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    patient INTEGER REFERENCES patients (id) NOT NULL,
    doctor INTEGER REFERENCES doctors (id) NOT NULL,
    notes TEXT NULL
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    notes TEXT NULL,
    visit INTEGER REFERENCES visits (id) NOT NULL,
    disease INTEGER REFERENCES diseases (id) NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    medical_specialty INTEGER REFERENCES specialties (id) NULL,
    description TEXT NOT NULL
);

