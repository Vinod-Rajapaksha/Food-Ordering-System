-- Create Database
CREATE DATABASE FoodOrderingDB;
USE FoodOrderingDB;

-- Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(255) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Menu Table
CREATE TABLE Menu (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    ImageUrl VARCHAR(255) NOT NULL
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Placed',
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    MenuID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

-- Admins Table
CREATE TABLE Admins (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL
);

-- Review Table
CREATE TABLE Reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_id INT NOT NULL,
    comment TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(UserID),
    FOREIGN KEY (order_id) REFERENCES Orders(OrderID)
);

-- Insert Admin
INSERT INTO Admins (Email, Password) VALUES
('admin@gmail.com', 'admin');