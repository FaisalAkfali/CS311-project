use realestateDB;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Owner (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Property (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    location VARCHAR(255) NOT NULL,
    property_type ENUM('house', 'apartment') NOT NULL,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);

CREATE TABLE Contract (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status ENUM('active', 'terminated'),
    payment_amount DECIMAL(10, 2), 
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    customer_id INT,
    appointment_date DATETIME,
    status ENUM('scheduled', 'completed', 'canceled'),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Phone (
    phone_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    owner_id INT,
    phone_number VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);

CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    owner_id INT,
    address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);