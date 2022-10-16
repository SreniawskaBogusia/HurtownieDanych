-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 17:48:10.509

-- tables
-- Table: Client
CREATE TABLE Client (
    clientID int  NOT NULL,
    name varchar(50)  NOT NULL,
    address varchar(50)  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY  (clientID)
);

-- Table: Date
CREATE TABLE Date (
    dateID int  NOT NULL,
    fullDate date  NOT NULL,
    day int  NOT NULL,
    mounth int  NOT NULL,
    year int  NOT NULL,
    CONSTRAINT Date_pk PRIMARY KEY  (dateID)
);

-- Table: FactTable
CREATE TABLE FactTable (
    transactionID int  NOT NULL,
    Fruit_fruitID int  NOT NULL,
    Order_orderID int  NOT NULL,
    Client_clientID int  NOT NULL,
    Place_placeID int  NOT NULL,
    Time_timeID int  NOT NULL,
    Date_dateID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (transactionID)
);

-- Table: Fruit
CREATE TABLE Fruit (
    fruitID int  NOT NULL,
    name varchar(50)  NOT NULL,
    price float(2)  NOT NULL,
    FruitCategory_categoryID int  NOT NULL,
    CONSTRAINT Fruit_pk PRIMARY KEY  (fruitID)
);

-- Table: FruitCategory
CREATE TABLE FruitCategory (
    categoryID int  NOT NULL,
    categoryName varchar(50)  NOT NULL,
    CONSTRAINT FruitCategory_pk PRIMARY KEY  (categoryID)
);

-- Table: Order
CREATE TABLE "Order" (
    orderID int  NOT NULL,
    quantity int  NOT NULL,
    amount int  NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY  (orderID)
);

-- Table: Place
CREATE TABLE Place (
    placeID int  NOT NULL,
    address varchar(50)  NOT NULL,
    name varchar(50)  NOT NULL,
    CONSTRAINT Place_pk PRIMARY KEY  (placeID)
);

-- Table: Time
CREATE TABLE Time (
    timeID int  NOT NULL,
    fullTime time  NOT NULL,
    hour int  NOT NULL,
    minutes int  NOT NULL,
    seconds int  NOT NULL,
    CONSTRAINT Time_pk PRIMARY KEY  (timeID)
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

-- Reference: FactTable_Fruit (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Fruit
    FOREIGN KEY (Fruit_fruitID)
    REFERENCES Fruit (fruitID);

-- Reference: FactTable_Order (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Order
    FOREIGN KEY (Order_orderID)
    REFERENCES "Order" (orderID);

-- Reference: FactTable_Place (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Place
    FOREIGN KEY (Place_placeID)
    REFERENCES Place (placeID);

-- Reference: FactTable_Time (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Time
    FOREIGN KEY (Time_timeID)
    REFERENCES Time (timeID);

-- Reference: Fruit_FruitCategory (table: Fruit)
ALTER TABLE Fruit ADD CONSTRAINT Fruit_FruitCategory
    FOREIGN KEY (FruitCategory_categoryID)
    REFERENCES FruitCategory (categoryID);

-- End of file.

