create database [bookstore]
go

-- 1
SELECT * FROM Books WHERE Pages > 500 AND Pages < 650;

-- 2
SELECT * FROM Books WHERE LEFT(Name, 1) IN ('A', 'H');

--3
SELECT b.* 
FROM Books b
JOIN Sales s ON b.Id = s.BookId
JOIN Themes t ON b.ThemeId = t.Id
WHERE t.Name = 'Детектив' AND s.Quantity > 30;

--4
SELECT * FROM Books WHERE Name LIKE '%Microsoft%' AND Name NOT LIKE '%Windows%';

--5
SELECT CONCAT(b.Name, ', ', t.Name, ', ', a.Name, ' ', a.Surname) AS Book_Info
FROM Books b
JOIN Themes t ON b.ThemeId = t.Id
JOIN Authors a ON b.AuthorId = a.Id
WHERE b.Price / b.Pages < 0.65;

--6
SELECT * FROM Books WHERE LEN(Name) - LEN(REPLACE(Name, ' ', '')) = 3;

--7 не працює
SELECT 
    Books.Name AS Book_Name,
    Themes.Name AS Theme,
    CONCAT(Authors.Name, ' ', Authors.Surname) AS Author_Name,
    Sales.Price AS Sale_Price,
    Sales.Quantity AS Sale_Quantity,
    Shops.Name AS Shop_Name
FROM 
    Sales
JOIN 
    Books ON Sales.BookId = Books.Id
JOIN 
    Themes ON Books.ThemeId = Themes.Id
JOIN 
    Authors ON Books.AuthorId = Authors.Id
JOIN 
    Shops ON Sales.ShopId = Shops.Id
WHERE 
    Books.Name NOT LIKE '%A%' 
    AND Themes.Name != 'Програмування' 
    AND CONCAT(Authors.Name, ' ', Authors.Surname) != 'Герберт Шилдт' 
    AND Sales.Price BETWEEN 10 AND 20 
    AND Sales.Quantity >= 30 
    AND Shops.CountryId NOT IN (1, 2); 

-- 8
SELECT 'Кількість авторів' AS Description, COUNT(*) AS Value FROM Authors
UNION
SELECT 'Кількість книг' AS Description, COUNT(*) FROM Books
UNION
SELECT 'Середня ціна продажу' AS Description, AVG(Price) FROM Sales
UNION
SELECT 'Середня кількість сторінок' AS Description, AVG(Pages) FROM Books;

--9
SELECT 
    Themes.Name AS Theme,
    SUM(Books.Pages) AS Total_Pages
FROM 
    Books
JOIN 
    Themes ON Books.ThemeId = Themes.Id
GROUP BY 
    Themes.Name;

--10
SELECT 
    CONCAT(Authors.Name, ' ', Authors.Surname) AS Author_Name,
    COUNT(Books.Id) AS Total_Books,
    SUM(Books.Pages) AS Total_Pages
FROM 
    Books
JOIN 
    Authors ON Books.AuthorId = Authors.Id
GROUP BY 
    CONCAT(Authors.Name, ' ', Authors.Surname);

--11
SELECT TOP 1 
    Books.*
FROM 
    Books
JOIN 
    Themes ON Books.ThemeId = Themes.Id
WHERE 
    Themes.Name = 'Роман'
ORDER BY 
    Books.Pages DESC;

--12
SELECT 
    Themes.Name AS Theme,
    AVG(Books.Pages) AS Pages
FROM 
    Books
JOIN 
    Themes ON Books.ThemeId = Themes.Id
GROUP BY 
    Themes.Name
HAVING 
    AVG(Books.Pages) <= 400;

--13
SELECT 
    Themes.Name AS Theme,
    SUM(Books.Pages) AS Total_Pages
FROM 
    Books
JOIN 
    Themes ON Books.ThemeId = Themes.Id
WHERE 
    Books.Pages > 400
    AND Themes.Name IN ('Роман', 'Драма', 'Фентезі')
GROUP BY 
    Themes.Name;

--14
SELECT 
    Books.Name AS Book,
    Authors.Name AS Author,
    Sales.Quantity AS Sold_Quantity,
    Shops.Name AS Shops,
    Countries.Name AS [Location],
    Sales.SaleDate AS Sale_Date
FROM 
    Sales
JOIN 
    Books ON Sales.BookId = Books.Id
JOIN 
    Authors ON Books.AuthorId = Authors.Id
JOIN 
    Shops ON Sales.ShopId = Shops.Id
JOIN 
    Countries ON Shops.CountryId = Countries.Id;

--15
SELECT TOP 1
    Shops.Name AS Shops,
    SUM(Sales.Price * Sales.Quantity) AS The_best
FROM 
    Sales
JOIN 
    Shops ON Sales.ShopId = Shops.Id
GROUP BY 
    Shops.Name
ORDER BY 
    The_best DESC;











