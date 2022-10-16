-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-14 21:28:43.326

-- tables
-- Table: Date
CREATE TABLE Date (
    dateID int  NOT NULL,
    fullDate date  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    CONSTRAINT Date_pk PRIMARY KEY  (dateID)
);

-- Table: FactTable
CREATE TABLE FactTable (
    ID int  NOT NULL,
    Product_productID int  NOT NULL,
    Warehouse_warehouseID int  NOT NULL,
    Date_dateID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (ID)
);

-- Table: Product
CREATE TABLE Product (
    productID int  NOT NULL,
    name varchar(50)  NOT NULL,
    brand varchar(50)  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (productID)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
    warehouseID int  NOT NULL,
    address varchar(50)  NOT NULL,
    country varchar(50)  NOT NULL,
    CONSTRAINT Warehouse_pk PRIMARY KEY  (warehouseID)
);

-- foreign keys
-- Reference: FactTable_Date (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Date
    FOREIGN KEY (Date_dateID)
    REFERENCES Date (dateID);

-- Reference: FactTable_Product (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Product
    FOREIGN KEY (Product_productID)
    REFERENCES Product (productID);

-- Reference: FactTable_Warehouse (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Warehouse
    FOREIGN KEY (Warehouse_warehouseID)
    REFERENCES Warehouse (warehouseID);

-- End of file.

