use RealEstateDB;

Create table Customer (
CustomerID INT auto_increment PRIMARY key,
FullName VARCHAR(100) NOT NULL,
Phone VARCHAR(20),
Email VARCHAR(100)
);