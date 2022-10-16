-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-14 21:20:08.811

-- tables
-- Table: Assesment
CREATE TABLE Assesment (
    assessmentID int  NOT NULL,
    PESEL int  NOT NULL,
    assessment int  NOT NULL,
    effectiveDate date  NOT NULL,
    "current" binary  NOT NULL,
    FactTable_PESEL int  NOT NULL,
    CONSTRAINT Assesment_pk PRIMARY KEY  (assessmentID)
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
    PESEL int  NOT NULL,
    address varchar(50)  NOT NULL,
    salary float(2)  NOT NULL,
    dateID int  NOT NULL,
    Date_dateID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (PESEL)
);

-- foreign keys
-- Reference: Assesment_FactTable (table: Assesment)
ALTER TABLE Assesment ADD CONSTRAINT Assesment_FactTable
    FOREIGN KEY (FactTable_PESEL)
    REFERENCES FactTable (PESEL);

-- Reference: FactTable_Date (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Date
    FOREIGN KEY (Date_dateID)
    REFERENCES Date (dateID);

-- End of file.

