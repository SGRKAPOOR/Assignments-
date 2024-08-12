-- Create the database
CREATE DATABASE PetRescueCharity;
GO

-- Use the created database
USE PetRescueCharity;
GO

-- Create Address table
CREATE TABLE Address (
    address_id INT IDENTITY(1,1) PRIMARY KEY,
    unit_num VARCHAR(10),
    street_number VARCHAR(10),
    street_name VARCHAR(100),
    street_type VARCHAR(20),
    street_direction VARCHAR(10),
    postal_code VARCHAR(10),
    city VARCHAR(50),
    province VARCHAR(50)
);

-- Create Volunteer table
CREATE TABLE Volunteer (
    volunteer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    group_leader BIT
);

-- Create Donation table
CREATE TABLE Donation (
    donation_id INT IDENTITY(1,1) PRIMARY KEY,
    donor_first_name VARCHAR(50),
    donor_last_name VARCHAR(50),
    donation_date DATE,
    donation_amount DECIMAL(10, 2),
    payment_method VARCHAR(20),
    address_id INT,
    volunteer_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (volunteer_id) REFERENCES Volunteer(volunteer_id)
);