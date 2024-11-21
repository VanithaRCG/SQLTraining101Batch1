

--Design an e-commerce setting, the main objectives are often to analyze sales data, track customer purchasing habits, 
--and monitor the performance of products and sales representatives. Let’s break down a possible data model and create relevant summary tables and views.

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Country VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL
);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Country, PostalCode) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', 'USA', '10001'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', 'Canada', 'A1B2C3'),
('Alice', 'Brown', 'alice.brown@example.com', '5647382910', 'UK', 'WC2N 5DU');


CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 1200.00, 50),
('Smartphone', 'Electronics', 800.00, 100),
('Headphones', 'Accessories', 50.00, 200),
('Desk Chair', 'Furniture', 150.00, 30),
('Notebook', 'Stationery', 5.00, 500);

CREATE TABLE SalesRepresentatives (
    SalesRepID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Region VARCHAR(50) NOT NULL
);

INSERT INTO SalesRepresentatives (FirstName, LastName, Email, PhoneNumber, Region) VALUES
('Emily', 'Johnson', 'emily.johnson@example.com', '1234567891', 'North America'),
('Michael', 'Lee', 'michael.lee@example.com', '9876543211', 'Europe'),
('Sophia', 'Martinez', 'sophia.martinez@example.com', '5647382911', 'Asia');

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    SalesRepID INT NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalesRepID) REFERENCES SalesRepresentatives(SalesRepID)
);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, SalesRepID, Status) VALUES
(1, '2024-11-01 10:00:00', 1250.00, 1, 'Completed'),
(2, '2024-11-02 12:30:00', 800.00, 2, 'Completed'),
(3, '2024-11-03 15:45:00', 205.00, 3, 'Pending');



CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice, TotalPrice) VALUES
(1, 1, 1, 1200.00, 1200.00),
(1, 3, 1, 50.00, 50.00),
(2, 2, 1, 800.00, 800.00),
(3, 4, 1, 150.00, 150.00),
(3, 5, 2, 5.00, 10.00);


CREATE VIEW ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalUnitsSold,
    SUM(od.TotalPrice) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductID, p.ProductName;


	CREATE VIEW CustomerPurchaseSummary AS
SELECT 
    c.CustomerID,
    c.FirstName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, FirstName;


	CREATE VIEW SalesRepPerformance AS
SELECT 
    sr.SalesRepID,
    sr.FirstName,
    COUNT(o.OrderID) AS TotalOrdersHandled,
    SUM(o.TotalAmount) AS TotalSales
FROM 
    SalesRepresentatives sr
JOIN 
    Orders o ON sr.SalesRepID = o.SalesRepID
GROUP BY 
    sr.SalesRepID, FirstName;
