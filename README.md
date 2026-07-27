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

The database contains five main tables.

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

## How to Run the Database

### 1. Install MySQL

```bash
sudo apt update
sudo apt install mysql-server
```

### 2. Start MySQL

```bash
sudo systemctl start mysql
```

### 3. Clone the Repository

```bash
git clone git@github.com:alex-njugi/APT1050UC_Project_676410.git
```

Enter the project folder:

```bash
cd APT1050UC_Project_676410
```

### 4. Run the SQL Script

```bash
sudo mysql < green_valley_medical_centre.sql
```

### 5. Open MySQL

```bash
sudo mysql
```

Select the database:

```sql
USE green_valley_medical_centre;
```

Display the tables:

```sql
SHOW TABLES;
```

## Sample Data

The database contains:

- 10 patients
- 5 doctors
- 15 appointments
- 15 treatments
- 15 initial payment records

## Business Intelligence Queries

The project includes SQL queries that answer the following management questions:

1. Which doctor attended the highest number of patients?
2. Which patients have outstanding payments?
3. What is the total revenue collected?
4. Which treatment generated the highest income?
5. Which appointments are scheduled within the next seven days?

The queries demonstrate:

- `JOIN`
- `GROUP BY`
- `ORDER BY`
- Aggregate functions
- Subqueries

## Transaction Management

The project demonstrates transaction management using:

```sql
START TRANSACTION;
COMMIT;
ROLLBACK;
```

`COMMIT` permanently saves a successful transaction, while `ROLLBACK` reverses incomplete changes if an operation fails.

## Entity Relationship Diagram

The ERD shows the relationships between Patients, Doctors, Appointments, Treatments and Payments.

![Green Valley Medical Centre ERD](images/Green%20Valley%20Medical%20Centre%20ERD.drawio.png)

## Project Report

The complete Microsoft Word report contains:

- Business requirements analysis
- Database design
- Entity Relationship Diagram
- Normalization from UNF to 3NF
- SQL implementation
- Genuine MySQL query screenshots
- Transaction management
- Project reflection

## Repository

GitHub repository:

`https://github.com/alex-njugi/APT1050UC_Project_676410`

## Author

**Alex Njugi Karanja**

- Student ID: **676410**
- Course: **APT1050 Database Systems**
- Lecturer: **Jane Muchiri**
- Submission date: **8 August 2026**

## Academic Purpose

This project was developed for educational purposes as part of the APT1050 Database Systems coursework.
