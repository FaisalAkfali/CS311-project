use RealEstateDB;

create table property (
	PropertyID INT auto_increment PRIMARY key,
    Type VARCHAR(50),
    Address VARCHAR(255),
    Size INT,
    Price DECIMAL(10,2),
    Status VARCHAR(50)
);

create table Owner (
OwnerID INT auto_increment PRIMARY key,
FullName VARCHAR(100),
Phone VARCHAR(20),
NationalID VARCHAR(20)
);