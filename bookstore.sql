use [bookstore]
go


INSERT INTO Countries (Name) VALUES
('USA'),
('UK'),
('France'),
('Germany'),
('Spain');


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


INSERT INTO Shops (Name, CountryId) VALUES
('Barnes & Noble', 1),
('Bookovka', 2),
('Librairie Galignani', 3),
('Gelikon DE', 4),
('Calders', 5);

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


INSERT INTO Sales (Price, Quantity, SaleDate, BookId, ShopId, EmployeeId) VALUES
(15.99, 10, '2024-03-20', 1, 1, 1),
(12.50, 20, '2024-03-21', 2, 2, 2),
(19.99, 15, '2024-03-22', 3, 3, 3),
(25.99, 8, '2024-03-23', 4, 4, 4),
(10.99, 12, '2024-03-24', 5, 5, 5),
(9.99, 15, '2024-03-25', 6, 1, 1),
(18.50, 18, '2024-03-26', 7, 2, 3),
(14.99, 22, '2024-03-27', 8, 3, 2),
(11.99, 25, '2024-03-28', 9, 4, 2),
(8.99, 30, '2024-03-29', 10, 5, 5);
