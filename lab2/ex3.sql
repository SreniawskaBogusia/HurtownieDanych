-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 17:15:40.832

-- tables
-- Table: Client
CREATE TABLE Client (
    clientID int  NOT NULL,
    phone_number int  NOT NULL,
    address varchar(50)  NOT NULL,
    name varchar(50)  NOT NULL,
    surname varchar(50)  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY  (clientID)
);

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
    trabsactionID int  NOT NULL,
    Firm_NIP int  NOT NULL,
    Product_ISBN int  NOT NULL,
    Date_dateID int  NOT NULL,
    Client_clientID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (trabsactionID)
);

-- Table: Firm
CREATE TABLE Firm (
    NIP int  NOT NULL,
    address int  NOT NULL,
    name int  NOT NULL,
    CONSTRAINT ID_firm PRIMARY KEY  (NIP)
);

-- Table: Product
CREATE TABLE Product (
    ISBN int  NOT NULL,
    publisher varchar(50)  NOT NULL,
    title varchar(50)  NOT NULL,
    author varchar(50)  NOT NULL,
    pages int  NOT NULL,
    position int  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ISBN)
);

-- foreign keys
-- Reference: FactTable_Client (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Client
    FOREIGN KEY (Client_clientID)
    REFERENCES Client (clientID);

-- Reference: FactTable_Date (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Date
    FOREIGN KEY (Date_dateID)
    REFERENCES Date (dateID);

-- Reference: FactTable_Firm (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Firm
    FOREIGN KEY (Firm_NIP)
    REFERENCES Firm (NIP);

-- Reference: FactTable_Product (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Product
    FOREIGN KEY (Product_ISBN)
    REFERENCES Product (ISBN);

-- End of file.

