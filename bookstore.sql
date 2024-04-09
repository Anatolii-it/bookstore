use [bookstore]
go

-- 1
SELECT * FROM Books WHERE Pages > 500 AND Pages < 650;

-- 2
SELECT * FROM Books WHERE LEFT(Name, 1) IN ('A', 'H'); 

--3
SELECT Books.* 
FROM Books
JOIN Sales ON Books.Id = Sales.BookId
JOIN Themes ON Books.ThemeId = Themes.Id
WHERE Themes.Name = 'Детектив' AND Sales.Quantity > 30;

--4
SELECT * FROM Books WHERE Name LIKE '%Microsoft%' AND Name NOT LIKE '%Windows%';

--5
SELECT CONCAT(Books.Name, ', ', Themes.Name, ', ', Authors.Name, ' ', Authors.Surname) AS Book_Themes_Authors
FROM Books
JOIN Themes ON Books.ThemeId = Themes.Id
JOIN Authors ON Books.AuthorId = Authors.Id
WHERE Books.Price / Books.Pages < 0.65;

--6
SELECT * FROM Books WHERE LEN(Name) - LEN(REPLACE(Name, ' ', '')) = 3;

--7 
SELECT 
    b.Name AS Book,
    t.Name AS Theme,
    CONCAT(a.Name, ' ', a.Surname) AS Author_Name,
    s.Price AS Price,
    s.Quantity AS Quantity,
    sh.Name AS Shop
FROM 
    Sales s
JOIN 
    Books b ON s.BookId = b.Id
JOIN 
    Authors a ON b.AuthorId = a.Id
JOIN 
    Themes t ON b.ThemeId = t.Id
JOIN 
    Shops sh ON s.ShopId = sh.Id
JOIN 
    Countries c ON sh.CountryId = c.Id
WHERE 
    b.Name NOT LIKE '%A%' 
    AND t.Name != 'Програмування' 
    AND CONCAT(a.Name, ' ', a.Surname) != 'Герберт Шилдт' 
    AND s.Price BETWEEN 10 AND 20 
    AND s.Quantity >= 8 
    AND c.Name NOT IN ('Spain', 'Italy');


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
    SUM(Books.Pages) AS Sum_Pages
FROM 
    Books
JOIN 
    Themes ON Books.ThemeId = Themes.Id
GROUP BY 
    Themes.Name;

--10
SELECT 
    CONCAT(Authors.Name, ' ', Authors.Surname) AS Author,
    COUNT(Books.Id) AS Books,
    SUM(Books.Pages) AS Sum_Pages
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
    Sales.Quantity AS Quantity,
    Shops.Name AS Shops,
    Countries.Name AS [Location],
    Sales.SaleDate AS Date_Sales
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











