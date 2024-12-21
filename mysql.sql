create database Sales;
SET GLOBAL time_zone = '+1:00';
DROP TABLE `sales`.`fact_table`, `sales`.`inventory_dimension`, `sales`.`products_dimension`, `sales`.`store_dimension`, `sales`.`time_dimension`;

-- Create the Time Dimension table
CREATE TABLE Time_Dimension (
    Date_ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL
);

-- Create the Products Dimension table
CREATE TABLE Products_Dimension (
    Product_ID INT PRIMARY KEY,
    ProductName VARCHAR(100),    
    Product_Category VARCHAR(100),
    Product_Cost DECIMAL(10, 2),
    Product_Price DECIMAL(10, 2)
);

-- Create the Store Dimension table
CREATE TABLE Store_Dimension (
    Store_ID INT PRIMARY KEY,
    Store_Name VARCHAR(100),
    Store_City VARCHAR(100),
    Store_Location VARCHAR(200),
    Store_Open_Date DATE
);

-- Create the Inventory Dimension table
CREATE TABLE Inventory_Dimension (
    Store_ID INT,
    Product_ID INT,
    Stock_On_Hand INT,
    PRIMARY KEY (Product_ID, Store_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products_Dimension(Product_ID),
    FOREIGN KEY (Store_ID) REFERENCES Store_Dimension(Store_ID)
);

-- Create the Fact Table
CREATE TABLE Fact_Table (
    Sale_ID INT PRIMARY KEY,
    Store_ID INT,
    Date_ID INT,
    Product_ID INT,    
    UnitsSold INT,
    Revenue float4,
    Profit float4,
    month INT,
    FOREIGN KEY (Product_ID) REFERENCES Products_Dimension(Product_ID),
    FOREIGN KEY (Store_ID) REFERENCES Store_Dimension(Store_ID),
    FOREIGN KEY (Date_ID) REFERENCES Time_Dimension(Date_ID)
);
drop table Fact_Table
select * from Fact_Table