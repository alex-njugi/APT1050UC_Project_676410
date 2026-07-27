# Green Valley Medical Centre Database System

## Project Overview

This project was developed for the **APT1050 Database Systems** course.

Green Valley Medical Centre is a growing private healthcare facility in Nairobi. The clinic previously stored patient records, appointments, treatments and payment information in separate spreadsheets. This caused duplicate records, inconsistent information and difficulties when generating reports.

The purpose of this project is to design and implement a relational database system that can be used by receptionists, doctors, accountants and management.

## Objectives

The database system is designed to:

- Store patient information
- Store doctor information and specialisations
- Schedule and manage appointments
- Record treatments provided to patients
- Record patient payments
- Calculate outstanding balances
- Generate management reports
- Maintain data integrity using keys, constraints and transactions

## Database Entities

The database contains five main tables:

### Patients

Stores patient personal and contact information.

Main attributes:

- `patient_id`
- `first_name`
- `last_name`
- `gender`
- `date_of_birth`
- `phone`
- `email`
- `address`

### Doctors

Stores doctor details and medical specialisations.

Main attributes:

- `doctor_id`
- `first_name`
- `last_name`
- `specialization`
- `phone`
- `email`

### Appointments

Stores appointment information and connects patients with doctors.

Main attributes:

- `appointment_id`
- `patient_id`
- `doctor_id`
- `appointment_date`
- `appointment_time`
- `status`
- `reason`

### Treatments

Stores the treatment provided during an appointment.

Main attributes:

- `treatment_id`
- `appointment_id`
- `treatment_name`
- `description`
- `treatment_cost`

### Payments

Stores payments made by patients for treatments.

Main attributes:

- `payment_id`
- `patient_id`
- `treatment_id`
- `payment_date`
- `amount`
- `payment_method`
- `reference_number`

## Entity Relationships

The database uses the following relationships:

- One patient can have many appointments
- One doctor can attend many appointments
- One appointment can have zero or one treatment
- One patient can make many payments
- One treatment can receive many payments

## Database Normalization

The database was normalized through the following stages:

- Unnormalized Form
- First Normal Form
- Second Normal Form
- Third Normal Form

Normalization helped to:

- Remove repeating groups
- Reduce duplicate data
- Remove partial dependencies
- Remove transitive dependencies
- Prevent update, insertion and deletion anomalies
- Improve data consistency

## Technologies Used

- MySQL 8.0
- SQL
- Visual Studio Code
- draw.io / diagrams.net
- Microsoft Word
- Ubuntu Linux
- 
