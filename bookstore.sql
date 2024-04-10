create database [bookstore2]
go
use bookstore2

-- Покупці
CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
	Surname NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
);
GO

-- Постачальники
CREATE TABLE Providers (
    ProviderId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
	Surname NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
);
GO

-- Країни
CREATE TABLE [Countries] (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
);

-- жанри
CREATE TABLE [Themes] (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
);

-- Автори
CREATE TABLE [Authors] (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    CountryId INT NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);

-- магазини
CREATE TABLE [Shops] (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
	CountryId INT NOT NULL,
);
-- Працівники
CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
	Surname NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary MONEY NOT NULL,
	ShopId INT NOT NULL,
	FOREIGN KEY (ShopId) REFERENCES Shops(Id)
);

-- Книги
CREATE TABLE Books (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Pages INT NOT NULL CHECK (Pages > 0),
    Price MONEY NOT NULL CHECK (Price >= 0),
    PublishDate DATE NOT NULL CHECK (PublishDate <= GETDATE()),
    AuthorId INT NOT NULL,
    ThemeId INT NOT NULL,
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id),
    FOREIGN KEY (ThemeId) REFERENCES Themes(Id)
);
-- Склад
CREATE TABLE Warehouse (
    WarehouseId INT PRIMARY KEY IDENTITY,
	BookId INT NOT NULL,
    Quantity INT NOT NULL,
	ShopId INT NOT NULL,
	FOREIGN KEY (ShopId) REFERENCES Shops(Id),
	FOREIGN KEY (BookId) REFERENCES Books(Id)
);

-- Продаж книг
CREATE TABLE Sales (
    Id INT PRIMARY KEY IDENTITY,
    Price MONEY NOT NULL CHECK (Price >= 0),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    SaleDate DATE NOT NULL DEFAULT GETDATE() CHECK (SaleDate <= GETDATE()),
    BookId INT NOT NULL,
    ShopId INT NOT NULL,
	CustomerId INT NOT NULL,
	EmployeeId INT NOT NULL,
    FOREIGN KEY (BookId) REFERENCES Books(Id),
    FOREIGN KEY (ShopId) REFERENCES Shops(Id),
	FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);


-- Покупка книг
CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY,
    PPrice MONEY NOT NULL CHECK (PPrice >= 0),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    OrderDate DATE NOT NULL DEFAULT GETDATE() CHECK (OrderDate <= GETDATE()),
    BookId INT NOT NULL,
    ShopId INT NOT NULL,
    ProviderId INT NOT NULL,
    EmployeeId INT NOT NULL,
    FOREIGN KEY (BookId) REFERENCES Books(Id),
    FOREIGN KEY (ShopId) REFERENCES Shops(Id),
    FOREIGN KEY (ProviderId) REFERENCES Providers(ProviderId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

-----------------------------------------------------------------------------------
--1
INSERT INTO Countries (Name) VALUES
('USA'),
('UK'),
('France'),
('Germany'),
('Spain');

--2
INSERT INTO Themes (Name) VALUES
('Фентезі'),
('Детектив'),
('Роман'),
('Наука'),
('Історія'),
('Поезія'),
('Драма'),
('Комедія'),
('Програмування'),
('Фантастика');

--3
INSERT INTO Authors (Name, Surname, CountryId) VALUES
('J.K.', 'Rowling', 3),
('Agatha', 'Christie', 2),
('Stephen', 'King', 1),
('Leo', 'Tolstoy', 4),
('Jane', 'Austen', 5),
('Ernest', 'Hemingway', 1),
('Gabriel', 'García Márquez', 5),
('Haruki', 'Murakami', 1),
('Margaret', 'Atwood', 2),
('George', 'Orwell', 3);

--4
INSERT INTO Shops (Name, CountryId) VALUES
('Barnes & Noble', 1),
('Bookovka', 2),
('Librairie Galignani', 3),
('Gelikon DE', 4),
('Calders', 5);


--5
INSERT INTO Employees (Name, Surname, Position, HireDate, Salary, ShopId)
VALUES 
    ('Іван', 'Петров', 'Продавець', '2022-01-05', 36000, 1),
    ('Марія', 'Іванова', 'Продавець', '2022-02-10', 34000, 1),
    ('Олег', 'Сидоров', 'Продавець', '2022-03-15', 22000, 2),
    ('Наталія', 'Василенко', 'Продавець', '2022-04-20', 23000, 2),
    ('Павло', 'Коваль', 'Продавець', '2022-05-25', 24000, 3),
    ('Оксана', 'Лисенко', 'Продавець', '2022-06-30', 25000, 3),
    ('Андрій', 'Гринь', 'Продавець', '2022-07-05', 41000, 4),
    ('Юлія', 'Коваленко', 'Продавець', '2022-08-10', 42000, 4),
    ('Тарас', 'Павлюк', 'Продавець', '2022-09-15', 28000, 5),
    ('Олена', 'Клименко', 'Продавець', '2022-10-20', 29000, 5);


	--6
INSERT INTO Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId) VALUES
('The Shining', 600, 15.99, '2023-05-10', 3, 1),
('Murder on the Orient', 350, 12.50, '2023-02-15', 2, 2),
('Harry Potter and', 800, 19.99, '2023-09-01', 1, 3),
('War and Peace', 1200, 25.99, '2023-01-01', 4, 3),
('Pride and Prejudice', 400, 10.99, '2023-07-20', 5, 3),
('The Old Man and the Sea', 250, 9.99, '2023-03-10', 6, 7),
('One Hundred Years of Solitude', 500, 18.50, '2023-12-05', 7, 5),
('Norwegian Wood', 400, 14.99, '2023-10-15', 8, 3),
('The Handmaid''s Tale', 350, 11.99, '2023-06-30', 9, 10),
('Microsoft History', 200, 8.99, '2023-04-15', 10, 10);

-- 7
INSERT INTO Customers (Name, Surname, Email, Phone)
VALUES
('John', 'Doe', 'johndoe@example.com', '1234567890'),
('Jane', 'Smith', 'janesmith@example.com', '1234567891'),
('Michael', 'Johnson', 'michaeljohnson@example.com', '1234567892'),
('Emily', 'Brown', 'emilybrown@example.com', '1234567893'),
('Daniel', 'Taylor', 'danieltaylor@example.com', '1234567894'),
('Jessica', 'Martinez', 'jessicamartinez@example.com', '1234567895'),
('David', 'Anderson', 'davidanderson@example.com', '1234567896'),
('Sarah', 'Wilson', 'sarahwilson@example.com', '1234567897'),
('James', 'Taylor', 'jamestaylor@example.com', '1234567898'),
('Maria', 'Garcia', 'mariagarcia@example.com', '1234567899');

-- постачальники
INSERT INTO Providers (Name, Surname, Email, Phone)
VALUES
('John', 'Doe', 'johndoe@example.com', '1234567890'),
('Jane', 'Smith', 'janesmith@example.com', '1234567891'),
('Michael', 'Johnson', 'michaeljohnson@example.com', '1234567892');

-- закупка книг
INSERT INTO Orders(PPrice, Quantity, OrderDate, BookId, ShopId, ProviderId, EmployeeId) VALUES
(10.99, 10, '2024-03-20', 1, 1, 1, 1),
(10.50, 20, '2024-03-21', 2, 2, 2, 3),
(10.99, 15, '2024-03-22', 3, 3, 3, 5),
(20.99, 8, '2024-03-23', 4, 4, 1, 7),
(5.99, 12, '2024-03-24', 5, 5, 3, 9),
(4.99, 15, '2024-03-25', 6, 1, 2, 2),
(12.50, 18, '2024-03-26', 7, 2, 1, 4),
(8.99, 22, '2024-03-27', 8, 3, 2, 6),
(7.99, 25, '2024-03-28', 9, 4, 3, 8),
(3.99, 30, '2024-03-29', 10, 5, 1, 10);

-- Внесення даних з таблиці "Orders" на склад

INSERT INTO Warehouse (BookId, Quantity, ShopId)
SELECT BookId, Quantity, ShopId
FROM Orders;

